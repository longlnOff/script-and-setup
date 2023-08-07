#!/bin/bash
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root."
  exit 1
fi
PCI_ID=$(lspci | grep "VGA compatible controller: NVIDIA Corporation" | cut -d' ' -f1)
#PCI_ID="0000:$PCI_ID"
for item in $PCI_ID
do
  item="0000:$item"
  FILE=/sys/bus/pci/devices/$item/numa_node
  echo Checking $FILE for NUMA connection status...
  if [[ -f "$FILE" ]]; then
    CURRENT_VAL=$(cat $FILE)
    if [[ "$CURRENT_VAL" -eq -1 ]]; then
      echo Setting connection value from -1 to 0.	  
      echo 0 > $FILE
    else
      echo Current connection value of $CURRENT_VAL is not -1.
    fi  
  else
    echo $FILE does not exist to update.
  fi
done