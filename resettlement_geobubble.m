%% resettlement geobubble
resettlement = readtable('resettlement2.csv');
resettlement_c = categorical(table2array(resettlement(:,1)));
resettlement_v = table2array(resettlement(:,4));
[resettlement_gn, resettlement_c] = findgroups(resettlement_c);
resettlement_sa = splitapply(@sum, resettlement_v, resettlement_gn);

gt_country = categorical(table2array(readtable('global_terror.xlsx', 'Range', 'E:E')));
gt_latitude = table2array(readtable('global_terror.xlsx', 'Range', 'J:J'));
gt_longitude = table2array(readtable('global_terror.xlsx', 'Range', 'K:K'));

% latitude NaN 제거
gt_tf = isnan(gt_latitude);           % NaN이면 1, 아니면 0
gt_country = gt_country(~gt_tf);         % NaN을 제거해야하므로 ~tf로 사용
gt_latitude = gt_latitude(~gt_tf);
gt_longitude = gt_longitude(~gt_tf);
% longitude NaN 제거
gt_tf = isnan(gt_longitude);
gt_country = gt_country(~gt_tf);
gt_latitude = gt_latitude(~gt_tf);
gt_longitude = gt_longitude(~gt_tf);

[group_num, groups] = findgroups(gt_country);               % fg에 그룹넘버, gr에 나라이름
mean_latitude = splitapply(@mean, gt_latitude, group_num);      % 나라별 latitude 평균
mean_longitude = splitapply(@mean, gt_longitude, group_num);    % 나라별 longitude 평균

% resettlement 나라마다 위도 경도 데이터 추가
for_count = 1;
ta(:,1) = array2table(resettlement_c);
for i = 1:size(resettlement_c)
    for j = for_count:size(groups)
        if resettlement_c(i,1) == groups(j,1)
            ta(i,2) = array2table(mean_latitude(j,1));
            ta(i,3) = array2table(mean_longitude(j,1));
            for_count = j;
            break;
        end
    end
end
% 위도 경도 데이터가 없는 나라 제거를 위한 iszero 생성
for i = 1:size(resettlement_c)
    if table2array(ta(i,2)) == 0
        resettlement_iszero(i,1) = false;
    else
        resettlement_iszero(i,1) = true;
    end
    if table2array(ta(i,1)) == 'Canada' % 지도상의 캐나다 좌표가 미국에 가깝기 때문에 위치조정
        ta(i,2) = array2table(60);
        ta(i,3) = array2table(-120);
    end
end

resettlement_latitude = table2array(ta(:,2));
resettlement_longitude = table2array(ta(:,3));
% iszero를 사용해 위도 경도 데이터가 없는 나라 제거
resettlement_c = resettlement_c(resettlement_iszero);
resettlement_latitude = resettlement_latitude(resettlement_iszero);
resettlement_longitude = resettlement_longitude(resettlement_iszero);
resettlement_sa = resettlement_sa(resettlement_iszero);

resettlement_geobubble = geobubble(resettlement_latitude, resettlement_longitude, resettlement_sa, resettlement_c);
resettlement_geobubble.Basemap = 'bluegreen';