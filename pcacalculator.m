function [MappedData,Mapping] = pcacalculator(Data,NumberOfDimensions)
%Function to compute Principal Component Analysis
%   This code is basically the code from Matlab Toolbox for Dimensianolity
%   Reduction by Laurens van der Maaten from Delft University of
%   Technology and Demonstration code provided on the course of Data 
%   mining in Jyv‰skyl‰ university.
%   NumberOfDimensions = tavoiteltu ulottuvuuksien m‰‰r‰, jos alle 1 niin 
%   osuus varianssista.
%   The PCA is well known tool for Dimensiality Reduction in data mining.

    if ~exist('NumberOfDimensions', 'var')
        NumberOfDimensions = 2;
    end
    
    % Make sure data is zero mean
    Mapping.mean = mean(Data, 1);
	Data = bsxfun(@minus, Data, Mapping.mean);

	% Compute covariance matrix
    if size(Data, 2) < size(Data, 1)
        CovMatOfData = cov(Data);
    else
        CovMatOfData = (1 / size(Data, 1)) * (Data * Data');        % if N>D, we better use this matrix for the eigendecomposition
    end
	
	% Perform eigendecomposition of C
	CovMatOfData(isnan(CovMatOfData)) = 0;
	CovMatOfData(isinf(CovMatOfData)) = 0;
    [EigenVectorMatrix, EigenValues] = eig(CovMatOfData);
    
    % Sort eigenvectors in descending order
    [EigenValues, OriginalIndex] = sort(diag(EigenValues), 'descend');
    if NumberOfDimensions < 1   % osuus varianssista
        NumberOfDimensions = find(cumsum(EigenValues ./ sum(EigenValues)) >= NumberOfDimensions, 1, 'first');
        disp(['Embedding into ' num2str(NumberOfDimensions) ' dimensions.']);
    end
    if NumberOfDimensions > size(EigenVectorMatrix, 2)
        NumberOfDimensions = size(EigenVectorMatrix, 2);
        warning(['Target dimensionality reduced to ' num2str(NumberOfDimensions) '.']);
    end
	EigenVectorMatrix = EigenVectorMatrix(:,OriginalIndex(1:NumberOfDimensions));
    EigenValues = EigenValues(1:NumberOfDimensions);
	
	% Apply mapping on the data
    if ~(size(Data, 2) < size(Data, 1))
        EigenVectorMatrix = bsxfun(@times, Data' * EigenVectorMatrix, (1 ./ sqrt(size(Data, 1) .* EigenValues))');     % normalize in order to get eigenvectors of covariance matrix
    end
    MappedData = Data * EigenVectorMatrix;
    
    % Store information for out-of-sample extension
    Mapping.EigenVectorMatrix = EigenVectorMatrix;
	Mapping.EigenValues = EigenValues;
    

end

