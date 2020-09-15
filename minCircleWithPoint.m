function [c,r] = minCircleWithPoint(sub,p)
[c,r] = circleFrom2Pts(sub(1,:),p);
for j=2:size(sub,1)
    p_j = sub(j,:);
    if (distance(p_j,c) > r)
        subsub = sub(1:j-1,:);
        [c, r] = minCircleWith2Point(subsub,p_j,p);
    end
end
end