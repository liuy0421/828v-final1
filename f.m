function [val] = f(a,b,xjs,yjs)
    
    total = 0;
    relu = @(w)max(w,0);
    
    for i = 1:length(xjs)
        ai = xjs(i);
        total = total + (relu([ai -1]*[a;b])-yjs(i))^2;
    end

    val = total/12;
end