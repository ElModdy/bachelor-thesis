
clear 
clc
close all

figure('Position', [10 10 1930 1090]);
plot_mod_surf(5);
view([-137.68 19.55])

y2=0.6;
y1=5.8;
t=2*atan(sqrt(y1/y2))-pi/2;
b=y2*sqrt(y1/y2);

z1=b*1i;
v1=tan_el(z1, t);

g=iso(z1,v1);

N=1000;
curve = animatedline("LineWidth",1,"Color",[0.1,0.1,0.1],"LineStyle","-");

t = linspace(0, 7, N);
old_ang = angle(v1);


pp=inj3d(real(z1),imag(z1),angle(v1),1);

old_ang_cam = angle(pp(1)+1i*pp(2));

pt=scatter3(pp(1),pp(2),pp(3),50,"red",'filled','o','LineWidth',50);
for kk = 1:N
    p=mobious(g*a_mat(t(kk)),[1i,1i]);
    changed = 1;
    
    if real(p(1))>.5 
        g = [1 -1;0 1]*g;
    elseif real(p(1))<-.5
        g = [1 1;0 1]*g;
    elseif abs(p)<1
        g = [0 1;-1 0]*g;
    else
        changed = 0;
    end
    if changed
        p=mobious(g*a_mat(t(kk)),[1i,1i]);
    end
    tt=angle(p(2));
    if abs(tt-old_ang)>pi
        curve = animatedline("LineWidth",1,"Color",[0.1,0.1,0.1],"LineStyle","-");
    end
    old_ang = tt;
    pp=inj3d(real(p(1)),imag(p(1)),tt,1);
    addpoints(curve,pp(1),pp(2),pp(3));
    set(pt,'XData',pp(1),'YData',pp(2),'ZData',pp(3));
    
    ang_cam = angle(pp(1)+1i*pp(2));

    drawnow;
    camorbit((ang_cam-old_ang_cam)*180/pi,0.01)
    old_ang_cam=ang_cam;
    F(kk) = getframe(gcf);
    pause(0.20);
end

video = VideoWriter("geodetic_flow_animation_in_F_3d.avi","MPEG-4");
open(video);
writeVideo(video,F);
close(video)
