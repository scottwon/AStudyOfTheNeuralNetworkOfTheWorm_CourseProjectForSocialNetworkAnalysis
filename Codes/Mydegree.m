function [num] = Mydegree(input,k)
%���ڼ�����ȡ����ȵ�kcore
num=0;
for i=1:306
    if input(i,1)>=k
        num=num+1;
    end
end
