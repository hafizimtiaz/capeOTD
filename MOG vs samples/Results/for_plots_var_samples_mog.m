clear all;clc;close all
FS = 36;

%% plotting the avg error in estimating the eigenvecs for N = 10, eps = 0.5/2

load MOG_vs_samples_K_5_N_10_eps_0_5_combined
load random_comp_error_MOG_K_5_N_10

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load MOG_vs_samples_K_5_N_10_eps_0_5_onlyTN
% errTN_mean = mean(err_vecTN);

figure(1)
subplot(121);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 1.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, \epsilon = 0.5, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%
load MOG_vs_samples_K_5_N_10_eps_2_combined
load random_comp_error_MOG_K_5_N_10

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load MOG_vs_samples_K_5_N_10_eps_2_onlyTN
% errTN_mean = mean(err_vecTN);

figure(1)
subplot(122);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 1.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, \epsilon = 2.0, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')


%% plotting the avg error in estimating the eigenvecs for N = 50, eps = 1/5

load MOG_vs_samples_K_10_N_50_eps_2_combined
load random_comp_error_MOG_K_10_N_50

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);


errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load MOG_vs_samples_K_10_N_50_eps_2_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(121);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 1.8])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, \epsilon = 2.0, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%
load MOG_vs_samples_K_10_N_50_eps_5_combined
load random_comp_error_MOG_K_10_N_50

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);


errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load MOG_vs_samples_K_10_N_50_eps_5_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(122);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 1.8])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, \epsilon = 5.0, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')



%%%%%%%%%%%% OLD PART %%%%%%%%%%%%%%%
% % load results_var_samples_MOG_K_5_N_10_ver3
% load results_var_samples_MOG_K_10_N_50_ver3
% 
% err_mean = mean(err);
% err_std = std(err);
% 
% errAG_mean = mean(errAG);
% errAG_std = std(errAG);
% 
% % errSN_mean = mean(errSN);
% % errSN_std = std(errSN);
% 
% errTPM_mean = mean(errTPM);
% errTPM_std = std(errTPM);
% 
% % load results_var_samples_MOG_K_5_N_10_only_VN_TN_ver3
% load results_var_samples_MOG_K_10_N_50_only_VN_TN_ver3
% errVN_mean = mean(errVN);
% errVN_std = std(errVN);
% 
% % errTN_mean = mean(errTN);
% % errTN_std = std(errTN);
% 
% % plotting the avg error in estimating the eigenvalues
% figure(1)
% subplot(121)
% semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
% % semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTPM_mean,'bs:','LineWidth',3,'MarkerSize',10); hold on
% 
% set(gca,'FontSize',12,'FontWeight','bold')
% xlabel('Number of samples','FontSize',14,'FontWeight','bold');
% ylabel('e_{prob}','FontSize',14,'FontWeight','bold');
% title('Synthetic data (with \epsilon = 1, \delta = 0.1): MOG','FontSize',14,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NW')
% 
% % plotting the avg error in estimating the eigenvectors
% % load results_var_samples_MOG_K_5_N_10_ver3
% load results_var_samples_MOG_K_10_N_50_ver3
% err_mean = mean(err_vec);
% err_std = std(err_vec);
% 
% errAG_mean = mean(err_vecAG);
% errAG_std = std(err_vecAG);
% 
% errTPM_mean = mean(err_vecTPM);
% errTPM_std = std(err_vecTPM);
% 
% % load results_var_samples_MOG_K_5_N_10_only_VN_TN_ver3
% load results_var_samples_MOG_K_10_N_50_only_VN_TN_ver3
% errVN_mean = mean(err_vecVN);
% errVN_std = std(err_vecVN);
% 
% % errTN_mean = mean(err_vecTN);
% % errTN_std = std(err_vecTN);
% 
% figure(1)
% subplot(122)
% semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
% % semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTPM_mean,'bs:','LineWidth',3,'MarkerSize',10); hold on
% 
% 
% set(gca,'FontSize',12,'FontWeight','bold')
% xlabel('Number of samples','FontSize',14,'FontWeight','bold');
% ylabel('e_{comp}','FontSize',14,'FontWeight','bold');
% title('Synthetic data (with \epsilon = 1, \delta = 0.1): MOG','FontSize',14,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NW')