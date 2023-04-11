function [] = plot_mod_surf(M) % M=3.5
    %figure('WindowState','maximized');
    set(gca, 'Projection','perspective');
    axis equal
    hold on
    
    N=100;
    y=linspace(0,M,N);
    x=linspace(-1/2,1/2,N);
    [X,Y]=meshgrid(x,y);
    Ys1=X;
    Xs1=X;
    Zs1=X;
    Ys2=X;
    Xs2=X;
    Zs2=X;
    ll=N^2;
    
    for i=1:ll
        p=inj3d(X(i),Y(i),-pi,0);
        Xs1(i)=p(1);
        Ys1(i)=p(2);
        Zs1(i)=p(3);
        p=inj3d(X(i),Y(i),pi,0);
        Xs2(i)=p(1);
        Ys2(i)=p(2);
        Zs2(i)=p(3);
    end
    
    
    surf(Xs1,Ys1,Zs1,'FaceAlpha',0.5,'EdgeColor','none');
    surf(Xs2,Ys2,Zs2,'FaceAlpha',0.5,'EdgeColor','none');


    y=linspace(1,M+1,N);
    a=2*atan(1./y);
    x=zeros(1,2*N);
    a=[a -flip(a)];
    a1=a+pi/2;
    a2=a-pi/2;
    y=[y flip(y)];
    
    xr1=x;
    zr1=x;
    yr1=x;
    xr2=x;
    zr2=x;
    yr2=x;
    for ii=1:2*N
        p=inj3d(x(ii),y(ii),a1(ii),1);
        xr1(ii)=p(1);
        yr1(ii)=p(2);
        zr1(ii)=p(3);
        p=inj3d(x(ii),y(ii),a2(ii),1);
        xr2(ii)=p(1);
        yr2(ii)=p(2);
        zr2(ii)=p(3);
    end

    fill3(xr1,yr1,zr1,[1, 142/255, 77/255],'FaceAlpha',0.65,'EdgeAlpha',0.7,'EdgeColor',[1, 99/255, 10/255]);
    fill3(xr2,yr2,zr2,[1, 142/255, 77/255],'FaceAlpha',0.65,'EdgeAlpha',0.7,'EdgeColor',[1, 99/255, 10/255]);


end