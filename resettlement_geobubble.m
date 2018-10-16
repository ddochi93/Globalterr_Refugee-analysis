%% resettlement geobubble
resettlement = readtable('resettlement2.csv');
resettlement_c = categorical(table2array(resettlement(:,1)));
resettlement_v = table2array(resettlement(:,4));
[resettlement_gn, resettlement_c] = findgroups(resettlement_c);
resettlement_sa = splitapply(@sum, resettlement_v, resettlement_gn);

gt_country = categorical(table2array(readtable('global_terror.xlsx', 'Range', 'E:E')));
gt_latitude = table2array(readtable('global_terror.xlsx', 'Range', 'J:J'));
gt_longitude = table2array(readtable('global_terror.xlsx', 'Range', 'K:K'));

% latitude NaN ����
gt_tf = isnan(gt_latitude);           % NaN�̸� 1, �ƴϸ� 0
gt_country = gt_country(~gt_tf);         % NaN�� �����ؾ��ϹǷ� ~tf�� ���
gt_latitude = gt_latitude(~gt_tf);
gt_longitude = gt_longitude(~gt_tf);
% longitude NaN ����
gt_tf = isnan(gt_longitude);
gt_country = gt_country(~gt_tf);
gt_latitude = gt_latitude(~gt_tf);
gt_longitude = gt_longitude(~gt_tf);

[group_num, groups] = findgroups(gt_country);               % fg�� �׷�ѹ�, gr�� �����̸�
mean_latitude = splitapply(@mean, gt_latitude, group_num);      % ���� latitude ���
mean_longitude = splitapply(@mean, gt_longitude, group_num);    % ���� longitude ���

% resettlement ���󸶴� ���� �浵 ������ �߰�
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
% ���� �浵 �����Ͱ� ���� ���� ���Ÿ� ���� iszero ����
for i = 1:size(resettlement_c)
    if table2array(ta(i,2)) == 0
        resettlement_iszero(i,1) = false;
    else
        resettlement_iszero(i,1) = true;
    end
    if table2array(ta(i,1)) == 'Canada' % �������� ĳ���� ��ǥ�� �̱��� ������ ������ ��ġ����
        ta(i,2) = array2table(60);
        ta(i,3) = array2table(-120);
    end
end

resettlement_latitude = table2array(ta(:,2));
resettlement_longitude = table2array(ta(:,3));
% iszero�� ����� ���� �浵 �����Ͱ� ���� ���� ����
resettlement_c = resettlement_c(resettlement_iszero);
resettlement_latitude = resettlement_latitude(resettlement_iszero);
resettlement_longitude = resettlement_longitude(resettlement_iszero);
resettlement_sa = resettlement_sa(resettlement_iszero);

resettlement_geobubble = geobubble(resettlement_latitude, resettlement_longitude, resettlement_sa, resettlement_c);
resettlement_geobubble.Basemap = 'bluegreen';