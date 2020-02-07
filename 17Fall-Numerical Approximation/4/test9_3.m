disp('fr')
for i=0:15
    for j=0:3
        fprintf('%13e   ',fr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('\n')
disp('fi')
for i=0:15
    for j=0:3
        fprintf('%13e   ',fi(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('\n')
disp('pr')
for i=0:15
    for j=0:3
        fprintf('%13e   ',pr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('\n')
disp('pi')
for i=0:15
    for j=0:3
        fprintf('%13e   ',pii(4*i+j+1))
    end
    fprintf('\n')
end