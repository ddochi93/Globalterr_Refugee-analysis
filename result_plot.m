%% �׷��߻�Ƚ���� �����û�Ǽ� ������� �м�
%  load result.mat;
% globalterrorismdb0718dist; % = my_terror_DB;
asylum_db = readtable('asylum_seekers.csv');

% ������ �����û�ڼ�(1999~2017)
[origin_flag,origin] = findgroups(asylum_db(:,2));
origin = categorical(table2array(origin));
no_of_asylum_seekers = splitapply(@sum, asylum_db.Value,origin_flag); % 1999~2017������ �����û�ڼ� (total)
origin_no_of_asylum_table = [array2table(origin),array2table(no_of_asylum_seekers)];



% ������ �׷��߻��Ǽ�(1999~2017)
globalterrorismdb0718dist = my_terror_DB(68442:end,:); %�����û�ڿ��� ��Ȯ�� �񱳸� ���� 1999�������� �׷��� �м�
[nation_flag,nation]= findgroups(globalterrorismdb0718dist(:,5));
no_of_terror_attacks = splitapply(@sum,globalterrorismdb0718dist.Var1,nation_flag); %1999~2017������ ������ �׷� �߻� �Ǽ�

nation = string(table2array(nation));
origin = string(table2array(origin_no_of_asylum_table(:,1)));
flag = zeros(length(origin),1);
for i = 1:length(nation)
    for j = 1: length(origin)
        if nation(i) == origin(j)
            flag(j) = i;
        end
        
    end
end

flag_for_invalid_string = ones(length(origin),1);
for idx = 1: length(flag_for_invalid_string)
    for jdx = 1: length(flag)
        if flag(idx) == 0
            flag_for_invalid_string(idx) = idx;
        end
    end
end
origin_no_of_asylum_table([4,6,15,20,24,26,30,34,40,46:47,51,56,64,70,71,72,97,107:110,118,120,122,124:125,131,134,139,141,143,151,157:161,166,168,179,181,190:191,193,198:199,204,208,210],:) = [];


% �������� �񱳸� ���� �����û�ڼ� ���̺�� �������׷��߻��Ǽ��� ��ħ
no_of_asylum_seekers = table2array( origin_no_of_asylum_table(:,2));
merged_table = [array2table(nation),array2table(no_of_asylum_seekers),array2table(no_of_terror_attacks)];
% plot(no_of_terror_attacks,no_of_asylum_seekers);
%   no_of_terror_attacks([2,80,143]) = [];
%   no_of_asylum_seekers([2,80,143]) = [];   % �˹ٴϾ� ,�ڼҺ� ,�ø��ƴ� ������ �����ǹǷ� ����


%% ��� �׷���
for i = 1:length(no_of_terror_attacks)
        hold on
        markerSize = no_of_terror_attacks(i) / 100;
        if(markerSize < 10)
            markerSize =10;
        end
        plot(no_of_asylum_seekers(i),no_of_terror_attacks(i),'Color',[rand(), rand(), rand()],'Marker','.','LineStyle','none','MarkerSize',markerSize);
       
           axis([-2000 1000000 -2000 25000]);
%          legend(nation);
    
end
xlabel('���� ��û�� ��');
ylabel('�׷� �߻� �Ǽ�');

