function [new_pop] = mutation(pop, pm)
% ԭ������Ⱥ����������һ���Ļ��ʷ�������
% param: pop ��Ⱥ�Ļ�������
% param: pm ����������Ļ���
% return: new_pop �������µĻ�������
%==========================================================================
[px,py] = size(pop);
new_pop = ones(size(pop));
for i = 1:px
    if(rand<pm)
        mpoint = round(rand*py);
        if mpoint<=0
            mpoint = 1;
        end
        new_pop(i,:) = pop(i,:);
        if new_pop(i, mpoint)==0
            new_pop(i, mpoint) = 1;
        else new_pop(i, mpoint) = 0;
        end
    else
        new_pop(i, :)=pop(i, :);
    end
end
end

