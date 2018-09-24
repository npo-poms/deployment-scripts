#!/usr/bin/env bash
# NPO ICT verzaakt ernstig om zaken leveren op de dev-omgeving.
# Het lijkt me hopeloos om te gaan verzoeken of ze dat proberen te verbeteren.
# Dan gaan we zelf maar scriptjes schrijven. Zo ingewikkeld is het ook niet.
# Hadden we jaren eerder moeten doen.
#
# We vertrouwen dus op de .camel folders in test. Dat is het nadeel. En als er iets verandert, dan moet ons dat opvallen en moeten we het hier fixen.
# Maar goed, dat bleek dus toch al zo te zijn.
# Zie https://jira.vpro.nl/browse/MSE-4120



DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

if [ -f $DIR/copy.lock ]; then
    (>&2 echo "Already running")
    exit
fi

touch $DIR/copy.lock

$DIR/copy-pd.sh 2>&1 | tee -a  $DIR/copy-pd.log
$DIR/copy-subtitles.sh 2>&1 | tee -a  $DIR/copy-subtitles.log
$DIR/copy-projectm-authority.sh 2>&1 | tee -a  $DIR/copy-projectm-authority.log
$DIR/copy-project-.sh 2>&1 | tee -a  $DIR/copy-projectm.log
$DIR/copy-pluto.sh 2>&1 | tee -a  $DIR/copy-pluto.log
$DIR/copy-duration.sh 2>&1 | tee -a  $DIR/copy-duration.log
$DIR/copy-radiobox.sh 2>&1 | tee -a  $DIR/copy-radiobox.log

rm $DIR/copy.lock
