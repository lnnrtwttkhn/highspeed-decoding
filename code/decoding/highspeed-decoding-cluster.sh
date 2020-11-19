#!/usr/bin/bash
# ==============================================================================
# SCRIPT INFORMATION:
# ==============================================================================
# SCRIPT: PARALELLIZE THE DECODING SCRIPT ON THE MPIB CLUSTER (TARDIS)
# PROJECT: HIGHSPEED
# WRITTEN BY LENNART WITTKUHN, 2018 - 2020
# CONTACT: WITTKUHN AT MPIB HYPHEN BERLIN DOT MPG DOT DE
# MAX PLANCK RESEARCH GROUP NEUROCODE
# MAX PLANCK INSTITUTE FOR HUMAN DEVELOPMENT (MPIB)
# MAX PLANCK UCL CENTRE FOR COMPUTATIONAL PSYCHIATRY AND AGEING RESEARCH
# LENTZEALLEE 94, 14195 BERLIN, GERMANY
# ==============================================================================
# DEFINE ALL PATHS:
# ==============================================================================
# define the name of the current task:
TASK_NAME="highspeed-decoding"
# define the name of the project:
PROJECT_NAME="highspeed"
# path to the home directory:
PATH_HOME=/home/mpib/wittkuhn
# path to the current code folder:
PATH_CODE=${PATH_HOME}/${PROJECT_NAME}/${TASK_NAME}/code/decoding
# cd into the directory of the current script:
cd ${PATH_CODE}
# path to the current script:
PATH_SCRIPT=${PATH_CODE}/highspeed_decoding.py
# path to the output directory:
PATH_OUT=${PATH_HOME}/${PROJECT_NAME}/${TASK_NAME}/decoding
# path to the working directory:
PATH_WORK=${PATH_HOME}/${PROJECT_NAME}/${TASK_NAME}/work
# path to the log directory:
PATH_LOG=${PATH_HOME}/${PROJECT_NAME}/${TASK_NAME}/logs/$(date '+%Y%m%d_%H%M%S')
# ==============================================================================
# CREATE RELEVANT DIRECTORIES:
# ==============================================================================
# create output directory:
if [ ! -d ${PATH_OUT} ]; then
	mkdir -p ${PATH_OUT}
fi
# create working directory:
if [ ! -d ${PATH_WORK} ]; then
	mkdir -p ${PATH_WORK}
fi
# create directory for log files:
if [ ! -d ${PATH_LOG} ]; then
	mkdir -p ${PATH_LOG}
fi
# ==============================================================================
# DEFINE PARAMETERS:
# ==============================================================================
# maximum number of cpus per process:
N_CPUS=1
# memory demand in *GB*
MEM=20GB
# user-defined subject list
PARTICIPANTS=$1
# ==============================================================================
# RUN THE DECODING:
# ==============================================================================
# initialize a counter for the subjects:
SUB_COUNT=0
for i in {1..40}; do
	# turn the subject id into a zero-padded number:
	SUB=$(printf "%02d\n" ${i})
	# name of the job
	echo "#PBS -N decoding_sub-${SUB}" >> job
	# set the expected maximum running time for the job:
	echo "#PBS -l walltime=12:00:00" >> job
	# determine how much RAM your operation needs:
	echo "#PBS -l mem=${MEM}" >> job
	# request multiple cpus:
	echo "#PBS -l nodes=1:ppn=${N_CPUS}" >> job
	# write (output) log to log folder:
	echo "#PBS -o ${PATH_LOG}" >> job
	# write (error) log to log folder:
	echo "#PBS -e ${PATH_LOG}" >> job
	# email notification on abort/end, use 'n' for no notification:
	echo "#PBS -m n" >> job
	# start in the current directory:
	echo "#PBS -d ${PATH_CODE}" >> job
	# activate virtual environment on cluster:
	echo "source /etc/bash_completion.d/virtualenvwrapper" >> job
	echo "workon decoding" >> job
	# define the main command:
	echo "python3 ${PATH_SCRIPT} ${SUB}" >> job
	# submit job to cluster queue and remove it to avoid confusion:
	qsub job
	rm -f job
done
