function [a,b,fs,gs,ags,bgs] = GD(a0,b0,ffun,gafun,gbfun,xjs,yjs,alpha_strat,nsteps)

    fs = zeros(1,nsteps);
    gs = zeros(1,nsteps);
    ags = zeros(1,nsteps);
    bgs = zeros(1,nsteps);

    a = a0; b = b0;
    
    alpha = 0.000005;
    for k = 1: nsteps
        ga = gafun(a,b,xjs,yjs);
        gb = gbfun(a,b,xjs,yjs);
        ags(k) = ga;
        bgs(k) = gb;
        gs(k) = norm([ga gb]);
        fs(k) = ffun(a,b,xjs,yjs);
        if strcmp(alpha_strat, "constant")
            alpha = alpha;
        elseif strcmp(alpha_strat, "slow")
            alpha = 0.1/k;
        elseif strcmp(alpha_strat, "exponential")
            alpha = alpha*0.99;
        else
            alpha = 0.001;
        end
        a = a - alpha*ga;
        b = b - alpha*gb;
    end

end