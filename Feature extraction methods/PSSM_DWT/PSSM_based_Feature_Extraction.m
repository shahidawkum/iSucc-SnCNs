clc
clear all

n_protein = 4475;
spoints = [1, 0; 1, -1; 0, -1; -1, -1; -1, 0; -1, 1; 0, 1; 1, 1];

fileFolder=fullfile('D:\Research_2024\Postdoc_2024\5_DeepAIPs-Pred_2024\5_DeepAIPs-Pred_2024\AIPS_2024_code\ACPpssm_training');
dirOutput=dir(fullfile(fileFolder,'*.txt'));
PSSM_XXXX={dirOutput.name}';
PSSM_XXXX = natsortfiles(PSSM_XXXX);
fileNames_PSSM = [];
for i=1:n_protein
	path_way = [fileFolder '\' cell2mat(PSSM_XXXX(i))];
	lujing=cellstr(path_way);
	fileNames_PSSM = [fileNames_PSSM;lujing];
end


%%%%%%%%%%% Features extraction from PSSM %%%%%%%%%%%%%%%% 

for i=1:n_protein
	files_name = cell2mat(fileNames_PSSM(i));
    i
	PSSM_Matrix = Read_Text_files_PSSM(files_name);
    
    
    
    %%%%%%%%%%% DWT-PSSM %%%%%%%%%%%%%%%%
     P = PSSM_Matrix;
	P = P';
	FF = GetDWT(P);
    PSSM_DWT_4475training(i,:)=FF;  
    
	end
 
%%%%%%%%%%%%%%%%%%%%%%%% SAVE FILES %%%%%%%%%%%%%%%%%%%%%%%%%


save  PSSM_DWT_4475training  PSSM_DWT_4475training;

%%%% To Create CSV sheet for the data %%%%%%%%%
   
      csvwrite('PSSM_DWT_4475training.csv',PSSM_DWT_4475training);