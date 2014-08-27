#!/bin/sh

PYTHON_PATH=`which python`
SED_PATH=`which sed`
PERL_PATH=`which perl`
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$PYTHON_PATH $SCRIPT_DIR/mdb2sqlite.py $1 \
| $SED_PATH "s/\`Forearm\`/\`forearms\`/g" \
| $SED_PATH "s/\`Hip\`/\`hips\`/g" \
| $SED_PATH "s/\`HipHSA\`/\`hip_hsas\`/g" \
| $SED_PATH "s/\`Lateral\`/\`laterals\`/g" \
| $SED_PATH "s/\`QcParam\`/\`qc_params\`/g" \
| $SED_PATH "s/\`RefPhysician\`/\`ref_physicians\`/g" \
| $SED_PATH "s/\`Spine\`/\`spines\`/g" \
| $SED_PATH "s/\`SubRegionComposition\`/\`sub_region_compositions\`/g" \
| $SED_PATH "s/\`SystemId\`/\`system_ids\`/g" \
| $SED_PATH "s/\`ScanAnalysis\`/\`scan_analyses\`/g" \
| $SED_PATH "s/\`TenYearFxRisk\`/\`ten_year_fx_risks\`/g" \
| $SED_PATH "s/\`Version\`/\`versions\`/g" \
| $SED_PATH "s/\`Wbody\`/\`w_bodies\`/g" \
| $SED_PATH "s/\`WbodyComposition\`/\`w_body_compositions\`/g" \
| $SED_PATH "s/\`PATIENT\`/\`patients\`/g" \
| $SED_PATH "s/\`SubRegionBone\`/\`sub_region_bones\`/g" \
| $SED_PATH "s/^INSERT/INSERT OR REPLACE/g" \
| $PERL_PATH -pe "s/\`([A-Z_a-z0-9]+)\`/\`\L\1\`/g" \
| $PERL_PATH -pe "s/\`([A-Z_a-z0-9]+)&([A-Z_a-z0-9]+)\`/\`\L\1_\L\2\`/g"