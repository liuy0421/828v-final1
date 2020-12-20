function [val] = grad_f(A, x, gis)

    total = 0;
    relu = @(w)max(w,0);
    drelu = @(w)ones(size(w)).*sign(relu(w));
    
    for i = 1:length(A)
        ai = A(i,:);
        gi = gis(i);
        total = total + ai*drelu(ai*x)*relu(ai*x)-gi*ai*drelu(ai*x);
    end
    
    val = total./6;
end