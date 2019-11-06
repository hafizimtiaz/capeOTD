clear all;clc;close all
FS = 36;

%% plotting the avg error in estimating the eigenvecs for N = 10, eps = 0.5/2

load STM_vs_samples_K_5_N_10_eps_0_5_combined
load random_comp_error_STM_K_5_N_10

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load STM_vs_samples_K_5_N_10_eps_0_5_onlyTN
% errTN_mean = myErrMean(err_vecTN);

figure(1)
subplot(121);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 1.0])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 0.5, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM','Random vectors','Location','NE')

%
load STM_vs_samples_K_5_N_10_eps_2_combined
load random_comp_error_STM_K_5_N_10

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = myErrMean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));

errVN_mean = myErrMean(err_vecVN);
% errVN_std = std(errVN);


errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load STM_vs_samples_K_5_N_10_eps_2_onlyTN
% errTN_mean = myErrMean(err_vecTN);

figure(1)
subplot(122);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 1.0])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 2.0, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private', 'AGN','AVN','DP-TPM', 'Random vectors','Location','NE')


%% plotting the avg error in estimating the eigenvecs for N = 50, eps = 1/5

load STM_vs_samples_K_10_N_50_eps_1_combined
load random_comp_error_STM_K_10_N_50

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));

errVN_mean = myErrMean(err_vecVN);
% errVN_std = std(errVN);


errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load STM_vs_samples_K_10_N_50_eps_1_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(121);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 0.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 1.0, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%
load STM_vs_samples_K_10_N_50_eps_5_combined
load random_comp_error_STM_K_10_N_50

err_mean = mean(err_vec);
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = myErrMean(err_vecAG);
% errAG_std = std(errAG);

errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);


errRND_mean = mean(repmat(err_vecRND,1,length(D_all)));

% load STM_vs_samples_K_10_N_50_eps_5_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(122);
semilogx(D_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(D_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(D_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([D_all(1)/10 D_all(end)*10 -0.05 0.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Sample size (N)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, \epsilon = 5.0, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')



%%%%%%%%%%%% OLD PART %%%%%%%%%%%%%%%


% %% plotting the avg error in estimating the eigenvalues
% load results_var_samples_STM_K_5_N_10
% % load results_var_samples_STM_K_10_N_50
% 
% err = myErrPreprocess(err);
% errAG = myErrPreprocess(errAG);
% errTPM = myErrPreprocess(errTPM);
% 
% err_mean = mean(err(:,1:end));
% err_std = std(err(:,1:end));
% 
% errAG_mean = mean(errAG(:,1:end));
% errAG_std = std(errAG(:,1:end));
% 
% % errSN_mean = mean(errSN);
% % errSN_std = std(errSN);
% 
% errTPM_mean = mean(errTPM(:,1:end));
% errTPM_std = std(errTPM(:,1:end));
% 
% load results_var_samples_STM_K_5_N_10_only_VN_TN
% % load results_var_samples_STM_K_10_N_50_only_VN_TN
% 
% errVN = myErrPreprocess(errVN);
% 
% errVN_mean = mean(errVN(:,1:end));
% errVN_std = std(errVN(:,1:end));
% 
% % errTN_mean = mean(errTN);
% % errTN_std = std(errTN);
% 
% % plotting the avg error in estimating the eigenvalues
% figure(1)
% subplot(121)
% semilogx(D_all(1:end),err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all(1:end),errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all(1:end),errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
% % semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all(1:end),errTPM_mean,'bs:','LineWidth',3,'MarkerSize',10); hold on
% 
% set(gca,'FontSize',12,'FontWeight','bold')
% xlabel('Number of samples','FontSize',14,'FontWeight','bold');
% ylabel('e_{prob}','FontSize',14,'FontWeight','bold');
% title('Synthetic data (with \epsilon = 1, \delta = 0.1): STM','FontSize',14,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NW')
% 
% %% plotting the avg error in estimating the eigenvectors
% load results_var_samples_STM_K_5_N_10
% % load results_var_samples_STM_K_10_N_50
% 
% % err_vec = myErrPreprocess(err_vec);
% err_vecAG = myErrPreprocess(err_vecAG);
% err_vecTPM = myErrPreprocess(err_vecTPM);
% 
% % err_mean = mean(err_vec(:,1:end));
% % err_std = std(err_vec(:,1:end));
% 
% errAG_mean = mean(err_vecAG(:,1:end));
% errAG_std = std(err_vecAG(:,1:end));
% 
% errTPM_mean = mean(err_vecTPM(:,1:end));
% errTPM_std = std(err_vecTPM(:,1:end));
% 
% load results_var_samples_STM_K_5_N_10_only_VN_TN
% % load results_var_samples_STM_K_10_N_50_only_VN_TN
% 
% err_vec = myErrPreprocess(err_vec);
% err_vecVN = myErrPreprocess(err_vecVN);
% 
% err_mean = mean(err_vec(:,1:end));
% err_std = std(err_vec(:,1:end));
% 
% errVN_mean = mean(err_vecVN(:,1:end));
% errVN_std = std(err_vecVN(:,1:end));
% 
% % errTN_mean = mean(err_vecTN);
% % errTN_std = std(err_vecTN);
% 
% figure(1)
% subplot(122)
% semilogx(D_all(1:end),err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all(1:end),errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all(1:end),errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
% % semilogx(D_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(D_all(1:end),errTPM_mean,'bs:','LineWidth',3,'MarkerSize',10); hold on
% 
% set(gca,'FontSize',12,'FontWeight','bold')
% xlabel('Number of samples','FontSize',14,'FontWeight','bold');
% ylabel('e_{comp}','FontSize',14,'FontWeight','bold');
% title('Synthetic data (with \epsilon = 1, \delta = 0.1): STM','FontSize',14,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NW')
