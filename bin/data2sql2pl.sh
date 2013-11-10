#!/bin/sh

/usr/bin/python mdb2sqlite.py $1 \
| /usr/bin/sed "s/\`Forearm\`/\`forearms\`/g" \
| /usr/bin/sed "s/\`Hip\`/\`hips\`/g" \
| /usr/bin/sed "s/\`HipHSA\`/\`hip_hsas\`/g" \
| /usr/bin/sed "s/\`Lateral\`/\`laterals\`/g" \
| /usr/bin/sed "s/\`QcParam\`/\`qc_params\`/g" \
| /usr/bin/sed "s/\`RefPhysician\`/\`ref_physicians\`/g" \
| /usr/bin/sed "s/\`Spine\`/\`spines\`/g" \
| /usr/bin/sed "s/\`SubRegionComposition\`/\`sub_region_compositions\`/g" \
| /usr/bin/sed "s/\`SystemId\`/\`system_ids\`/g" \
| /usr/bin/sed "s/\`ScanAnalysis\`/\`scan_analyses\`/g" \
| /usr/bin/sed "s/\`TenYearFxRisk\`/\`ten_year_fx_risks\`/g" \
| /usr/bin/sed "s/\`Version\`/\`versions\`/g" \
| /usr/bin/sed "s/\`Wbody\`/\`w_bodies\`/g" \
| /usr/bin/sed "s/\`WbodyComposition\`/\`w_body_compositions\`/g" \
| /usr/bin/sed "s/\`PATIENT\`/\`patients\`/g" \
| /usr/bin/sed "s/\`SubRegionBone\`/\`sub_region_bones\`/g" \
| /usr/bin/perl -pe "s/\`([A-Z_a-z0-9]+)\`/\`\L\1\`/g"