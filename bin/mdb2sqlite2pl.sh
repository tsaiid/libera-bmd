#!/bin/sh

/usr/bin/python mdb2sqlite.py $1 \
| /usr/bin/sed "s/\`Forearm\`/\`Forearms\`/g" \
| /usr/bin/sed "s/\`Hip\`/\`Hips\`/g" \
| /usr/bin/sed "s/\`HipHSA\`/\`HipHSAs\`/g" \
| /usr/bin/sed "s/\`Lateral\`/\`Laterals\`/g" \
| /usr/bin/sed "s/\`QcParam\`/\`QcParams\`/g" \
| /usr/bin/sed "s/\`RefPhysician\`/\`RefPhysicians\`/g" \
| /usr/bin/sed "s/\`Spine\`/\`Spines\`/g" \
| /usr/bin/sed "s/\`SubRegionComposition\`/\`SubRegionCompositions\`/g" \
| /usr/bin/sed "s/\`SystemId\`/\`SystemIds\`/g" \
| /usr/bin/sed "s/\`ScanAnalysis\`/\`Scan_Analyses\`/g" \
| /usr/bin/sed "s/\`TenYearFxRisk\`/\`TenYearFxRisks\`/g" \
| /usr/bin/sed "s/\`Version\`/\`Versions\`/g" \
| /usr/bin/sed "s/\`Wbody\`/\`Wbodies\`/g" \
| /usr/bin/sed "s/\`WbodyComposition\`/\`WbodyCompositions\`/g" \
| /usr/bin/sed "s/\`PATIENT\`/\`PATIENTS\`/g" \
| /usr/bin/sed "s/\`SubRegionBone\`/\`SubRegionBones\`/g"