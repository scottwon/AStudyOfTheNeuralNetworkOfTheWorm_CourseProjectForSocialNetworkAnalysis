%first ԭʼ���ݶ���
%Link �����ڽӾ���1,2������1��2
first=textread('first.txt');
Link=zeros(306,306);
for i=1:2345
    Link(first(i,1),first(i,2))=first(i,3);
end
clear first;
%Link_u��Ϊ����ͼʱ���ٽӾ���
Link_u=zeros(306,306);
for i=1:306
    for j=1:306
        Link_u(i,j)=Link(i,j)+Link(j,i);
    end
end
clear i j;
%second��first���Ƶģ���ʾ����ͼ���������
second(1,1)=1;
count=1;
for i=1:306
    for j=1:306
        if Link_u(i,j)~=0
            second(count,1)=i;
            second(count,2)=j;
            second(count,3)=Link_u(i,j);
            count=count+1;
        end
    end
end
clear count i j;
%in_degree���
%out_degree����
%u_degree��Ϊ����ͼ�Ķ�
in_degree=sum(Link~=0)';
out_degree=sum(Link'~=0)';
u_degree=sum(Link_u,2);
%�ڶ���������Ϊ�ж�k
num=zeros(100,1);

for k=1:150
   result=Mydegree_u(u_degree,k,second);
    for l=1:306
       if result(l,2)==1
       num(k,1)=num(k,1)+1;
       end
    end
end
clear k l result;

for i=1:100
    innum(i)=Mydegree(in_degree,i);
    outnum(i)=Mydegree(out_degree,i);
end
clear i;

%k=55
k=55;
result=Mydegree_u(u_degree,k,second);
u_del(1)=0;
count=1;
for i=1:306
    if result(i,2)==1
        u_del(count)=i;
        count=count+1;
    end
end
clear k count i;

count=1;
u_res=Link_u;
count_d=0;
for i=1:306
    if u_del(count)~=i  
        u_res(i-count_d,:)=[];
        u_res(:,i-count_d)=[];
        count_d=count_d+1;
    elseif count<43
        count=count+1;
    else
        count=44;
    end
end

u_mylink(1,1)=0;
count=1;
for i=1:44
    for j=1:44
        if u_res(i,j)~=0
            u_mylink(count,1)=i;
            u_mylink(count,2)=j;
            u_mylink(count,3)=u_res(i,j);
            count=count+1;
        end
    end
end
plot(innum)
hold on
plot(outnum)
hold on
plot(num)
clear i j;
%fid=fopen('k55.txt','wt');
%m=73;
%for i=1:m
%    fprintf(fid,'%4d\t',u_del(i));
%end
%fclose(fid);
%clear i fid m;
%fprintf(fid,'%s',u_del);
%fclose(fid);