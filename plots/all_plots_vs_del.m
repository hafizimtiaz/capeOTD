clear all;clc;close all

FS = 24;

%% plotting STM vs delta
% plotting STM D = 10, N = 100k/800k, eps = 0.1

load STM_vs_delta_K_5_D_10_N_100k_eps_0_1

err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(245);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 0.8])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\epsilon=0.1, N_s = 20k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')
tmp = legend('Non-priv.','capeAGN','conv','local', 'Rand. vect.', 'Location', 'best');
tmp.FontSize = FS - 10;

%
load STM_vs_delta_K_5_D_10_N_800k_eps_0_1

err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(246);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 0.6])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\epsilon=0.1, N_s = 160k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')


% plotting STM N = 50, D = 100k/800k

load STM_vs_delta_K_10_D_50_N_100k_eps_2


err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(247);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 0.4])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\epsilon=2.0, N_s = 20k, D = 50, S = 5)','FontSize',FS,'FontWeight','bold')


%
load STM_vs_delta_K_10_D_50_N_800k_eps_2


err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(248);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 0.4])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\epsilon=2.0, N_s = 160k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')

%% plotting MOG vs delta
% plotting MOG D = 10, N = 100k/800k, eps = 0.1

load MOG_vs_delta_K_5_D_10_N_100k_eps_0_1

err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_MOG_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(241);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 1.4])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\epsilon=0.1, N_s = 20k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')
tmp = legend('Non-priv.','capeAGN','conv','local', 'Rand. vect.', 'Location', 'best');
tmp.FontSize = FS - 6;

%
load MOG_vs_delta_K_5_D_10_N_800k_eps_0_1

err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_MOG_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(242);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 1.4])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\epsilon=0.1, N_s = 160k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')


% plotting MOG N = 50, D = 100k/800k

load MOG_vs_delta_K_10_D_50_N_100k_eps_2


err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_MOG_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(243);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 1.4])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\epsilon=2.0, N_s = 20k, D = 50, S = 5)','FontSize',FS,'FontWeight','bold')


%
load MOG_vs_delta_K_10_D_50_N_800k_eps_2


err_mean = mean(repmat(err_vec,1,length(delta_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_MOG_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(delta_all)));

figure(1)
subplot(244);
semilogx(delta_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(delta_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([delta_all(1)/10 delta_all(end)*10 -0.05 1.4])
xticks(delta_all(1:2:end))
xticklabels({'0.0001', '0.001', '0.01'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\delta)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\epsilon=2.0, N_s = 160k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')

