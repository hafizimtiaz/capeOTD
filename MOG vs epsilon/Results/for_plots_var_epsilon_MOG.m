clear all;clc;close all

FS = 36;

%% plotting the avg error in estimating the eigenvecs for N = 10, D = 100k/800k

load MOG_vs_epsilon_K_5_N_10_D_100k_combined
load random_comp_error_MOG_K_5_N_10

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load MOG_vs_epsilon_K_5_N_10_D_100k_onlyTN
% errTN_mean = mean(err_vecTN);

figure(1)
subplot(121);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.01 1.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, N = 100k, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM','Random vectors','Location','NE')

%
load MOG_vs_epsilon_K_5_N_10_D_800k_combined
load random_comp_error_MOG_K_5_N_10

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load MOG_vs_epsilon_K_5_N_10_D_800k_onlyTN
% errTN_mean = mean(err_vecTN);

figure(1)
subplot(122);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 1.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, N = 800k, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%% plotting the avg error in estimating the eigenvecs for N = 50, D = 100k/800k

load MOG_vs_epsilon_K_10_N_50_D_100k_combined
load random_comp_error_MOG_K_10_N_50

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load MOG_vs_epsilon_K_10_N_50_D_100k_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(121);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 1.8])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, N = 100k, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM','Random vectors','Location','NE')

load MOG_vs_epsilon_K_10_N_50_D_800k_combined
load random_comp_error_MOG_K_10_N_50

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = mean(err_vecTPM);
errTPM_std = std(err_vecTPM);

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load MOG_vs_epsilon_K_10_N_50_D_800k_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(122);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 1.8])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('MOG (\delta=0.01, N = 800k, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%%%%%%%%%%%%% OLD PART %%%%%%%%%%%%%
% %% plotting the avg error in estimating the eigenvalues
% 
% load results_var_epsilon_MOG_K_5_N_10
% % load results_var_epsilon_MOG_K_10_N_50_ver3
% 
% err_mean = mean(repmat(err,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));
% 
% errAG_mean = mean(errAG);
% errAG_std = std(errAG);
% 
% errTPM_mean = mean(errTPM);
% errTPM_std = std(errTPM);
% 
% load results_var_epsilon_MOG_K_5_N_10_only_VN_TN
% % load results_var_epsilon_MOG_K_10_N_50_only_VN_TN_ver3
% 
% errVN_mean = mean(errVN);
% errVN_std = std(errVN);
% 
% % errTN_mean = mean(errTN);
% % errTN_std = std(errTN);
% 
% figure(1)
% subplot(121);
% semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
% % semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTPM_mean,'bs:','LineWidth',3,'MarkerSize',10); hold on
% axis([epsilon_all(1) epsilon_all(end) 0 0.30])
% 
% set(gca,'FontSize',FS,'FontWeight','bold')
% xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
% ylabel('e_{prob}','FontSize',FS,'FontWeight','bold');
% title('Synthetic data (with \delta=0.1): MOG','FontSize',FS,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NE')
% 
% %% plotting the avg error in estimating the eigenvectors
% load results_var_epsilon_MOG_K_5_N_10
% % load results_var_epsilon_MOG_K_10_N_50_ver3
% 
% err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err_vec,1,length(epsilon_all)));
% 
% errAG_mean = mean(err_vecAG);
% errAG_std = std(err_vecAG);
% 
% errTPM_mean = mean(err_vecTPM);
% errTPM_std = std(err_vecTPM);
% 
% load results_var_epsilon_MOG_K_5_N_10_only_VN_TN
% % load results_var_epsilon_MOG_K_10_N_50_only_VN_TN_ver3
% errVN_mean = mean(err_vecVN);
% errVN_std = std(err_vecVN);
% 
% % errTN_mean = mean(err_vecTN);
% % errTN_std = std(err_vecTN);
% 
% figure(1)
% subplot(122)
% semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
% % semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTPM_mean,'bs:','LineWidth',3,'MarkerSize',10); hold on
% axis([epsilon_all(1) epsilon_all(end) 0 7])
% 
% set(gca,'FontSize',FS,'FontWeight','bold')
% xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
% ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
% title('Synthetic data (with \delta=0.1): MOG','FontSize',FS,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NE')