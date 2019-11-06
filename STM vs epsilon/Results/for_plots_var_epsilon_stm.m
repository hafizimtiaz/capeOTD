clear all;clc;close all

FS = 36;

%% plotting the avg error in estimating the eigenvecs for N = 10, D = 100k/800k

load STM_vs_epsilon_K_5_N_10_D_100k_combined
load random_comp_error_STM_K_5_N_10

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

% err_vecAG = myErrPreprocess(err_vecAG);
errAG_mean = myErrMean(err_vecAG);
% errAG_std = std(errAG);

% err_vecTPM = myErrPreprocess(err_vecTPM);
errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));

% err_vecVN = myErrPreprocess(err_vecVN);
errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load STM_vs_epsilon_K_5_N_10_D_100k_onlyTN
% errTN_mean = myErrMean(err_vecTN);

figure(1)
subplot(121);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 1.0])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N = 100k, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%
load STM_vs_epsilon_K_5_N_10_D_800k_combined
load random_comp_error_STM_K_5_N_10

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

% err_vecAG = myErrPreprocess(err_vecAG);
errAG_mean = myErrMean(err_vecAG);
% errAG_std = std(errAG);

% err_vecTPM = myErrPreprocess(err_vecTPM,1);
% errTPM_mean = err_vecTPM;
errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));
% errTPM_mean = mean(err_vecTPM);
% errTPM_std = std(errTPM);

% err_vecVN = myErrPreprocess(err_vecVN);
errVN_mean = myErrMean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load STM_vs_epsilon_K_5_N_10_D_800k_onlyTN
% errTN_mean = myErrMean(err_vecTN);

figure(1)
subplot(122);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 1.0])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N = 800k, D = 10)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')


%% plotting the avg error in estimating the eigenvecs for N = 50, D = 100k/800k

load STM_vs_epsilon_K_10_N_50_D_100k_combined
load random_comp_error_STM_K_10_N_50

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

% err_vecTPM = myErrPreprocess(err_vecTPM);
errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load STM_vs_epsilon_K_10_N_50_D_100k_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(121);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 0.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N = 100k, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%
load STM_vs_epsilon_K_10_N_50_D_800k_combined
load random_comp_error_STM_K_10_N_50

err_mean = mean(repmat(err_vec,1,length(epsilon_all)));
% err_std = std(repmat(err,1,length(epsilon_all)));

errAG_mean = mean(err_vecAG);
% errAG_std = std(errAG);

% err_vecTPM = myErrPreprocess(err_vecTPM);
errTPM_mean = myErrMean(err_vecTPM);
errTPM_std = sqrt(myErrVar(err_vecTPM));

errVN_mean = mean(err_vecVN);
% errVN_std = std(errVN);

errRND_mean = mean(repmat(err_vecRND,1,length(epsilon_all)));

% load STM_vs_epsilon_K_10_N_50_D_800k_onlyTN
% errTN_mean = mean(err_vecTN);

figure(2)
subplot(122);
semilogx(epsilon_all,err_mean,'gs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errAG_mean,'rs:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errVN_mean,'ks:','LineWidth',3,'MarkerSize',10); hold on
errorbar(epsilon_all,errTPM_mean,errTPM_std,'bs:','LineWidth',3,'MarkerSize',10); hold on
% semilogx(epsilon_all,errTN_mean,'ms:','LineWidth',3,'MarkerSize',10); hold on
semilogx(epsilon_all,errRND_mean,'cs:','LineWidth',3,'MarkerSize',10); hold on
axis([epsilon_all(1)/10 epsilon_all(end)*10 -0.05 0.6])

set(gca,'FontSize',FS,'FontWeight','bold')
xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
ylabel('e_{comp}','FontSize',FS,'FontWeight','bold');
title('STM (\delta=0.01, N = 800k, D = 50)','FontSize',FS,'FontWeight','bold')
% legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
legend('Non-private','AGN','AVN','DP-TPM', 'Random vectors','Location','NE')

%%%%%%%%%%%%% OLD PART %%%%%%%%%%%%%


% FS = 36;
% %% plotting the avg error in estimating the eigenvalues
% 
% load results_var_epsilon_STM_K_10_N_50
% err = myErrPreprocess(err);
% errAG = myErrPreprocess(errAG);
% errTPM = myErrPreprocess(errTPM);
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
% load results_var_epsilon_STM_K_10_N_50_only_VN_TN
% errVN = myErrPreprocess(errVN);
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
% title('Synthetic data (with \delta=0.01): STM','FontSize',FS,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NE')
% 
% %% plotting the avg error in estimating the eigenvectors
% load results_var_epsilon_STM_K_10_N_50
% err_vec = myErrPreprocess(err_vec');
% err_vecAG = myErrPreprocess(err_vecAG);
% err_vecTPM = myErrPreprocess(err_vecTPM);
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
% load results_var_epsilon_STM_K_10_N_50_only_VN_TN
% err_vecVN = myErrPreprocess(err_vecVN);
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
% title('Synthetic data (with \delta=0.01): STM','FontSize',FS,'FontWeight','bold')
% % legend('Non-private','Proposed AG','Proposed VN','Proposed TN','DP-TPM', 'Location','NW')
% legend('Non-private','Proposed AG','Proposed VN','DP-TPM', 'Location','NE')