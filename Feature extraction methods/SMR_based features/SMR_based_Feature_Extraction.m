clc
clear all
load('energy_20.mat');

feature_train=[];


[data, sequence] = fastaread('succinylation_sites_Training_Dataset.txt');

Total_Seq_train=size(sequence,2);
for i=1:(Total_Seq_train)
     i
    SEQ=sequence(i);
    SEQ=cell2mat(SEQ);
    P=SMR(SEQ,energy_20);
	P=P';
    P = uint8(255 * mat2gray(P));
	
            
%%%%%%%%%%% DCT-SMR %%%%%%%%%%%%%%%%
     
    FF=dct2(P);
    FF=FF(1:10,1:10);
	SMR_DCT_features(i,:)=FF(:);
    
    %%%%%%%%%%%%%%HOG-SMR%%%%%%%%%%%%%%%%%%%
   FF=HOG(P);
   SMR_HOG_features(i,:)=FF;
       
end

%%%%%%%%%%%%%%%%%%%%%%%% SAVE FILES %%%%%%%%%%%%%%%%%%%%%%%%%


SMR_DCT_features_succinylation_training=[SMR_DCT_features];
SMR_HOG_features_succinylation_training =[SMR_HOG_features];

save SMR_DCT_features_succinylation_training SMR_DCT_features_succinylation_training;
save SMR_HOG_features_succinylation_training SMR_HOG_features_succinylation_training;

%%%% To Create CSV sheet for the data %%%%%%%%%
   
     csvwrite('SMR_DCT_features_succinylation_training.csv',SMR_DCT_features_succinylation_training);
    csvwrite('SMR_HOG_features_succinylation_training.csv',SMR_HOG_features_succinylation_training);
     


