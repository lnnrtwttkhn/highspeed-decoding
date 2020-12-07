# Highspeed Decoding

## Overview

This repository contains results of the multivariate pattern classification pipeline used in Wittkuhn & Schuck, 2020, *Nature Communications*.

## Dataset structure

- `/code` contains all project-specific code with sub-directories `/docs` for project-specific documentation and `/decoding` for the code relevant to run the deoding pipeline
- `/decoding` contains the results of the decoding pipeline
- `/bids` contains the defaced BIDS-converted MRI dataset
- `/fmriprep` contains pre-processed MRI data
- `/glm` contains results of the first-level GLM pipeline used for feature selection
- `/masks` contains binarized anatomical masks and smoothed fMRI data

## Citation

> Wittkuhn, L. and Schuck, N. W. (2020). Dynamics of fMRI patterns reflect sub-second activation sequences and reveal replay in human visual cortex. *Nature Communications*.

A preprint (old version) is available at:

> Wittkuhn, L. and Schuck, N. W. (2020). Faster than thought: Detecting sub-second activation sequences with sequential fMRI pattern analysis. *bioRxiv*. [doi:10.1101/2020.02.15.950667](http://dx.doi.org/10.1101/2020.02.15.950667)

## Contact

Please [create a new issue](https://github.com/lnnrtwttkhn/highspeed-decoding/issues/new) if you have questions about the code or data, if there is anything missing, not working or broken.

For all other general questions, you may also write an email to:

- [Lennart Wittkuhn](mailto:wittkuhn@mpib-berlin.mpg.de)
- [Nicolas W. Schuck](mailto:schuck@mpib-berlin.mpg.de)

## License

All of the data are licensed under Creative Commons Attribution-ShareAlike 4.0.
Please see the [LICENSE](LICENSE) file and https://creativecommons.org/licenses/by-sa/4.0/ for details.
