clc;
format long
%Resuelva con el metodo de Gauss Jordan con pivoteo (parcial)
A=[-pi,log(2),-sqrt(5),-1/3;-exp(1),pi^2,-sqrt(2),1/7;0.001,-1520.2,714.3,0;3525.1,0.22,0,-315.7];
B=[20.1;-107.3;2017.6;-126.4];
M=[A eye(size(A))];
aux=M(1,:);M(1,:)=M(4,:);M(4,:)=aux;
M(1,:)=M(1,:)/M(1,1);
%M(2,:)=M(2,:)-M(1,:)*M(2,1)%Multiplicamos para hacerlos iguales y al restarse se  hagan cero 
%M(3,:)=M(3,:)-M(1,:)*M(3,1)
%  M(4,:)=M(4,:)-M(1,:)*M(4,1)
j=1;
while j<=4
    if M(j,j)<M(j+1,j)
                XD=M(j,:);    
                M(j,:)=M(j+1,:);
                M(j+1,:)=XD;
    end 
        for i=1:4
            if i~=1
            M(i,:)=M(i,:)-M(1,:)*M(i,1);
            end
        end
            j=j+1;
             if M(j,j)<M(j+1,j)
                XD=M(j,:);    
                M(j,:)=M(j+1,:);
                M(j+1,:)=XD;
             end 
             j=j+1;
            M(2,:)=M(2,:)/M(2,2);
            if M(j,j)<M(j+1,j)
                XD=M(j,:);    
                M(j,:)=M(j+1,:);
                M(j+1,:)=XD;
             end 
             j=j+1;
        for i=1:4
            if i~=2
            M(i,:)=M(i,:)-M(2,:)*M(i,2);
            end
        end
        if M(j,j)<M(j+1,j)
                XD=M(j,:);    
                M(j,:)=M(j+1,:);
                M(j+1,:)=XD;
        end  
             j=j+1;
            M(3,:)=M(3,:)/M(3,3);
        for i=1:4
            if i~=3
            M(i,:)=M(i,:)-M(3,:)*M(i,3);
            end
        end
        if M(j,j)<M(j+1,j)
                XD=M(j,:);    
                M(j,:)=M(j+1,:);
                M(j+1,:)=XD;
        end  
             j=j+1;
            M(4,:)=M(4,:)/M(4,4);
        for i=1:4
            if i~=4
            M(i,:)=M(i,:)-M(4,:)*M(i,4)
            end
        end    
end 

INV_A=M(:,5:8)
x=(INV_A)*B
rref([A B])