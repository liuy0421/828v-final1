function [val] = grad_b(a,b,xjs,yjs)
    
    total = 0;
    relu = @(w)max(w,0);
    drelu = @(w)ones(size(w)).*sign(relu(w));
    
    for i=1:length(xjs)
        total = total+ 2*xjs(i)*yjs(i)*drelu(a*xjs(i)-b)-2*drelu(a*xjs(i)-b)*relu(a*xjs(i)-b);
    end

    val = total/12;
end