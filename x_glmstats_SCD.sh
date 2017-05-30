SUBJECTS_DIR=/Applications/freesurfer/subjects
grpdir=/Users/jiangll/Documents/IPCAS/research/SCD_aMCI_AD/2dDNB_SCD84
FWHM=10
for hemi in lh rh
do
	for meas in dnb.SCD84
	do
		echo "GLM analysis for ${hemi}.${meas}"
		mri_glmfit \
  		--glmdir g4v2.${meas}.${hemi} \
        	--y ${hemi}.${meas}.corrected.fsaverage5.sm10.nii.gz \
  		--fsgd ${grpdir}/fsgd.g4v2 \
                --C $grpdir/scd-nc.mtx \
		--C $grpdir/diag.x.sex.mtx \
                --C $grpdir/male-female.mtx \
		--surf fsaverage5 ${hemi} \
		--cortex \
		--mask ${grpdir}/${hemi}.mask.SCD84.fsaverage5.nii.gz
	done
done
