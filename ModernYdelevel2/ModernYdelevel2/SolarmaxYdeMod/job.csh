#!/bin/csh -f

#PBS -N CosmicRay.inp
#PBS -P PHITS
#PBS -l select=1:ncpus=101:mpiprocs=101:ompthreads=1
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -q plmem
#PBS -m abe
#PBS -M guembou.cebastien@jaea.go.jp

limit stacksize unlimited
cd ${PBS_O_WORKDIR}

source /etc/profile.d/modules.csh

module load intel/cur
module load mpt/cur

setenv KMP_AFFINITY disable
setenv KMP_STACKSIZE 2g

mkdir -p $PBS_O_WORKDIR/TEMP
setenv TMPDIR ${PBS_O_WORKDIR}/TEMP

ln -sf /home/g7/a234017/phits3_33/phits/phits_SGI8600_MPI  ./phits

/usr/bin/time -p mpirun /home/g7/a234017/phits3_33/phits/phits_SGI8600_MPI < phits.in > phits.dat

rm -f   phits


