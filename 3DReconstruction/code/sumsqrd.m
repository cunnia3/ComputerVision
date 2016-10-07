function s = sumsqrd(box1,box2)
s = 0;
for i=1:size(box1,1)
    for j=1:size(box1,2)
        s = s + (int64(box1(i,j))-int64(box2(i,j)))^2;
    end;
end;
