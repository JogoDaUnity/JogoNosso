using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PcAnimatorEvent : MonoBehaviour
{

    // Script usado apenas para fazer animation event da camera do pc

    public GameObject pcUI;
    public GameObject otherUI;

    public void EnterPcEvent()
    {
        pcUI.SetActive(true);
        otherUI.SetActive(false);
    }
    public void ExitPcEvent()
    {
        pcUI.SetActive(false);
        otherUI.SetActive(true);
    }
}