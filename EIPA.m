set(0,'DefaultFigureWindowStyle','docked')
nx = 50;
ny = 50;
V = zeros(nx,ny);
G = sparse(nx*ny,ny*nx);


    for i = 1:nx 
        for j = 1:ny
        n = j +(i-1)*ny;
        nxm = j +(i-2)*ny;
        nxp = j +i*ny;
        nym =(j-1) +(i-1)*ny;
        nyp = (j+1) +(i-1)*ny;
        
            if i == 1 
            G(n,n) = 1;
            elseif i == nx
            G(n,n) = 1;
            elseif j == 1
            G(n,n) = 1;
            elseif j == ny
            G(n,n) = 1;
                
            else 
            G(n,n) = -4;
            G(nxp,n) = 1;
            G(nxm,n) = 1;
            G(nym,n) = 1;
            G(nyp,n) = 1;
            end           
        end
    end
%spy(G)
[E,D] = eigs(G,9,'SM');
plot(diag(D),'*');

np = ceil(sqrt(9))
figure('name','Modes')
for k = 1:9
    M = E(:,k);
    for i = 1:nx
        for j = 1:ny
            n = i + (j-1)*nx;
            V(i,j) = M(n);
        end
        subplot(np,np,k), surf(V,'linestyle','none')
        title(['EV = ' num2str(D(k,k))])
    end
end

