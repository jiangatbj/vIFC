SUBJECTS_DIR=/Applications/freesurfer/subjects
grpdir=/Users/jiangll/Documents/IPCAS/research/SCD_aMCI_AD/matlab_nc54
FWHM=10
for hemi in lh rh
do
	for meas in dnb.4g
	do
		echo "GLM analysis for ${hemi}.${meas}"
		mri_glmfit \
  		--glmdir g8v2.${meas}.${hemi} \
        	--y ${hemi}.${meas}.icvcorrected.fsaverage5.sm10.nii.gz \
  		--fsgd ${grpdir}/g8v2.fsgd \
                --C $grpdir/scd-nc.mtx \
		--C $grpdir/mci-nc.mtx \
                --C $grpdir/ad-nc.mtx \
                --C $grpdir/mci-scd.mtx \
                --C $grpdir/ad-mci.mtx \
                --C $grpdir/ad-scd.mtx \
		--surf fsaverage5 ${hemi} \
		--cortex \
		--mask ${grpdir}/${hemi}.mask.4g.fsaverage5.nii.gz
	done
done
