function PeakList = FindLocal(X, Flg, Thres)
if nargin < 2
   error('error');
end
if nargin == 2
   B = ones(size(X));
end
if nargin == 3
   if Flg == 1
      B = (X > (Thres));
   elseif Flg == -1
      B = (X < (Thres));
   else
      error('error');
   end
end
if nargin == 4
   if Flg == 1
      B = (X > (Thres));
   elseif Flg == -1
      B = (X < (Thres));
   else
      error('error');
   end
end
if nargin > 3
   error('error');
end
N = 1; % number of neighborhood peak
B(1,:) = 0;
B(end,:) = 0;
B(:,1) = 0;
B(:,end) = 0;
[a,b] = find(B);
Candinate = [a,b]';
PeakList = zeros([3,size(Candinate,2)]);
cnt=0;
if Flg == 1
   for l= 1:size(Candinate,2);
      y = Candinate(1,l);
      x =  Candinate(2,l);
      tmp = X(y-1:y+1,x-1:x+1); %  consider 8 neighbor pixel
      tmp = tmp(:);
         [val, ind ] = sort(tmp,'descend');
      for n=1:N
         if (ind(n) == 5)
            cnt = cnt+1;
            PeakList(:,cnt) = [Candinate(:,l);-inv(val(n))];
         end
      end
   end
   PeakList = PeakList(:,1:cnt);
   [ksk, ind] = sort(PeakList(3,:),'descend');
   PeakList = PeakList(:,ind);

elseif Flg == -1
   for l= 1:size(Candinate,2);
      y = Candinate(1,l);
      x =  Candinate(2,l);
      tmp = X(y-1:y+1,x-1:x+1); %  consider 8 neighbor pixel
      tmp = tmp(:);
      [val, ind ] = sort(tmp,'ascend');
      for n=1:N
         if (ind(n) == 5)
            cnt = cnt+1;
            PeakList(:,cnt) = [Candinate(:,l);val(n)];
         end
      end
   end
   PeakList = PeakList(:,1:cnt);
      [ksk, ind] = sort(PeakList(3,:),'ascend');
   PeakList = PeakList(:,ind);
end

