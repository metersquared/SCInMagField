function matrix=normalMetalRectangularCell(in)
    Nx=in.Nx;
    Ny=in.Ny;
    chemPot=in.chemPot;
    hopInt=in.hopInt;
    b=in.b;
    impurityArray=in.impurityArray;
    
    totState=Nx*Ny;
    A=-chemPot*ones(Nx,1);
    B=hopInt*ones(Nx-1,1);
    C=hopInt*ones(Nx,1);
    D=hopInt*ones(totState-Nx,1);
    tRight=diag(B,-1);
    tRightBoundary=zeros(Nx,Nx);
    tRightBoundary(1,Nx)=hopInt;
    tLeft=diag(B,1);
    tLeftBoundary=zeros(Nx,Nx);
    tLeftBoundary(Nx,1)=hopInt;
    tLeftBoundaryArraysub=repmat(tRightBoundary,1,Ny);
    tLeftBoundaryArray=repmat(tLeftBoundary,1,Ny);
    tRightArray=repmat(tRight,1,Ny);
    tLeftArray=repmat(tLeft,1,Ny);
    tLeft = mat2cell(tLeftArray, size(tLeft,1), repmat(size(tLeft,2),1,Ny));
    tLeft=blkdiag(tLeft{:});
    tRight = mat2cell(tRightArray, size(tRight,1), repmat(size(tRight,2),1,Ny));
    tRight=blkdiag(tRight{:});
    tRightBoundary=mat2cell(tLeftBoundaryArraysub, size(tRightBoundary,1), repmat(size(tRightBoundary,2),1,Ny));
    tLeftBoundary=mat2cell(tLeftBoundaryArray, size(tLeftBoundary,1), repmat(size(tLeftBoundary,2),1,Ny));
    tRightBoundary=blkdiag(tRightBoundary{:});
    tLeftBoundary=blkdiag(tLeftBoundary{:});
%-------------------------------------------    
    %This is implementation of the x direction Landau gauge.
    
    phase=1i*b*(2*pi);
    tRightPhase=exp(phase*[1:Ny]);
    tLeftPhase=exp(-phase*[1:Ny]);
    tRightBoundaryPhase=exp(phase*[1:Ny]*(1-Nx));
    tLeftBoundaryPhase=exp(-phase*[1:Ny]*(1-Nx));
    tRightBoundaryMat=repmat(tRightBoundaryPhase',1,Nx)';
    tRightBoundaryMat=diag(tRightBoundaryMat(:))*tRightBoundary;
    tLeftBoundaryMat=repmat(tLeftBoundaryPhase',1,Nx)';
    tLeftBoundaryMat=diag(tLeftBoundaryMat(:))*tLeftBoundary;
    tRightMat=repmat(tRightPhase',1,Nx)';
    tRightMat=diag(tRightMat(:))*tRight+tRightBoundaryMat;
    tLeftMat=repmat(tLeftPhase',1,Nx)';
    tLeftMat=diag(tLeftMat(:))*tLeft+tLeftBoundaryMat;
%-------------------------------------------
    
    diagonalBlock=diag(A);
    diagonalArray = repmat(diagonalBlock, 1, Ny); 
    diagonalBlockArray = mat2cell(diagonalArray, size(diagonalBlock,1), repmat(size(diagonalBlock,2),1,Ny));
    tUp=diag(D,Nx)+diag(C,Nx-totState);
    tDown=diag(C,totState-Nx)+diag(D,-Nx);
    laplaceMatrixNoY=blkdiag(diagonalBlockArray{:})+tLeftMat+tRightMat;
    %Hopping term generation, use phase to specify the phase factor due to a
    %vector potential
    %phase=1;
    
%-------------------------------------------    
%    This is implementation of the y direction Landau gauge.

    tDownBlock=diag(exp(0*[1:(Nx)]));
    tUpBlock=diag(exp(-0*[1:(Nx)]));
    tDownArray = repmat(tDownBlock, 1, Ny); 
    tDownArray(:,1:Nx)=diag(exp(-phase*(1:(Nx))*(Ny)));
    tDownBlockArray = mat2cell(tDownArray, size(tDownBlock,1), repmat(size(tDownBlock,2),1,Ny));
    tDownMat=blkdiag(tDownBlockArray{:})*tDown;
    tUpArray = repmat(tUpBlock, 1, Ny); 
    tUpArray(:,Nx*Ny-Nx+1:Nx*Ny)=diag(exp(phase*(1:(Nx))*(Ny)));
    tUpBlockArray = mat2cell(tUpArray, size(tUpBlock,1), repmat(size(tUpBlock,2),1,Ny));
    tUpMat=blkdiag(tUpBlockArray{:})*tUp;
    
%-------------------------------------------
    
    matrix=laplaceMatrixNoY+tDownMat+tUpMat+diag(impurityArray);
    %3. Gap block
    %gapArray=gapPara*ones(1,totState);
    %gapMatrix=diag(gapArray);

    %4. Generate block matrix
    %matrix=[laplaceMatrix gapMatrix; ctranspose(gapMatrix) -transpose(laplaceMatrix)];
end