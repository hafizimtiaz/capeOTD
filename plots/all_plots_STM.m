clear all;clc;close all

FS = 24;


%% plotting STM vs epsilon
% plotting STM D = 10, N = 100k/800k

load STM_vs_epsilon_K_5_D_10_N_100k


err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);


load random_comp_error_STM_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

figure(1)
subplot(241);
semilogx(epsilon_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 0.6])
xticks(epsilon_all(1:2:end))
xticklabels({'0.001', '0.01', '0.1', '1.0', '10.0'})

set(gca,'FontSize',FS-2,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N_s = 20k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')
legend('Non-priv.','capeAGN','conv','local', 'Rand. vect.', 'Location', 'best')

%
load STM_vs_epsilon_K_5_D_10_N_800k

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

figure(1)
subplot(242);
semilogx(epsilon_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 0.6])
xticks(epsilon_all(1:2:end))
xticklabels({'0.001', '0.01', '0.1', '1.0', '10.0'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N_s = 160k, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')


% plotting STM N = 50, D = 100k/800k

load STM_vs_epsilon_K_10_D_50_N_100k


err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

figure(1)
subplot(243);
semilogx(epsilon_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.03 0.30])
xticks(epsilon_all(1:2:end))
xticklabels({'0.001', '0.01', '0.1', '1.0', '10.0'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N_s = 20k, D = 50, S = 5)','FontSize',FS,'FontWeight','bold')


%
load STM_vs_epsilon_K_10_D_50_N_800k


err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

figure(1)
subplot(244);
semilogx(epsilon_all, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.03 0.30])
xticks(epsilon_all(1:2:end))
xticklabels({'0.001', '0.01', '0.1', '1.0', '10.0'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N_s = 160k, D = 50, S = 5)','FontSize',FS,'FontWeight','bold')


%% plotting STM vs samples
% plotting STM N = 10, eps = 0.5/2
S = 5;
load STM_vs_samples_K_5_D_10_eps_0_5


err_mean = mean(err_vec);
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(N_all)));

figure(1)
subplot(245);
semilogx(N_all/S, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([N_all(1)/(2*S) N_all(end)*2/S -0.05 0.6])
xticks(N_all(1:2:end)/S)
xticklabels({'10k', '40k', '160k'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N_s)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS-2,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 0.5, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')
legend('Non-priv.','capeAGN','conv','local', 'Rand. vect.', 'Location', 'best')

%
load STM_vs_samples_K_5_D_10_eps_2


err_mean = mean(err_vec);
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_5_N_10
errRND_mean = mean(repmat(err_vecRND,1,length(N_all)));

figure(1)
subplot(246);
semilogx(N_all/S, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([N_all(1)/(2*S) N_all(end)*2/S -0.05 0.6])

xticks(N_all(1:2:end)/S)
xticklabels({'10k', '40k', '160k'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N_s)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 2.0, D = 10, S = 5)','FontSize',FS,'FontWeight','bold')


% plotting STM N = 50, eps = 1/5

load STM_vs_samples_K_10_D_50_eps_1

err_mean = mean(err_vec);
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(N_all)));


figure(1)
subplot(247);
semilogx(N_all/S, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([N_all(1)/(2*S) N_all(end)*2/S -0.03 0.30])

xticks(N_all(1:2:end)/S)
xticklabels({'10k', '40k', '160k'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N_s)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 1.0, D = 50, S = 5)','FontSize',FS,'FontWeight','bold')

%
load STM_vs_samples_K_10_D_50_eps_5

err_mean = mean(err_vec);
errCAPE_mean = myErrMean(err_vecCAPE);
errCONV_mean = myErrMean(err_vecCONV);
errLOCAL_mean = myErrMean(err_vecLOCAL);

load random_comp_error_STM_K_10_N_50
errRND_mean = mean(repmat(err_vecRND,1,length(N_all)));

figure(1)
subplot(248);
semilogx(N_all/S, err_mean,'b*--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCAPE_mean,'kd--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errCONV_mean,'kx--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errLOCAL_mean,'kv--','LineWidth',3,'MarkerSize',10); hold on
semilogx(N_all/S, errRND_mean,'bs--','LineWidth',3,'MarkerSize',10); hold on
axis([N_all(1)/(2*S) N_all(end)*2/S -0.03 0.30])

xticks(N_all(1:2:end)/S)
xticklabels({'10k', '40k', '160k'})

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N_s)','FontSize',FS,'FontWeight','bold');
ylabel('q^{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 5.0, D = 50, S = 5)','FontSize',FS,'FontWeight','bold')

