function output = draw(X, cX, cY, cR, cL)
[H,W,D] = size(X);
if (D == 1)
    output = cat(3,X,X,X);
else
    output = X;
end
B=-cR:cR;
Yline = B+cY;
Yline(Yline<1 | Yline>H)=[]; % ensure the cross is within X
Xline = B+cX;
Xline(Xline<1 | Xline>W)=[]; % ensure the cross is within X
output(Yline, cX,:)=repmat(cL,numel(Yline),1);
output(cY,    Xline,:)=repmat(cL,numel(Xline),1);