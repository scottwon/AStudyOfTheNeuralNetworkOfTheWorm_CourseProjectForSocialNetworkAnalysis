function [num] = Mydegree_u(input,k,input_1)
%���ڼ�����Ϊ����ͼ��kcore
%input��һ��������ʾ�ȣ�input_1������ͼ���ٽ�״��������
num1=input;
for i=1:306
    num1(i,2)=1;
end
check=0;count=1;
while check==0
    check=1;
    for i=1:306
        if num1(i,2)==1
            if num1(i,1)<k
                num1(i,2)=0;
                check=0;
                while input_1(count,1)<i
                    count=count+1;
                end
                while input_1(count,1)==i
                    num1(input_1(count,2),1)=num1(input_1(count,2),1)-input_1(count,3);
                    if count<4296
                        count=count+1;
                    else
                        count=1;
                    end
                end
            end
        end
    end
    count=1;
end
num=num1;
end

