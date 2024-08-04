using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoftwareManager : MonoBehaviour
{
    [SerializeField] public SoftwareManager sM;
    [SerializeField] GameObject applicationPrefab;
    [SerializeField] Transform index;
    [SerializeField] GameObject opennedApp;

    public void OpenApplication()
    {
        opennedApp = Instantiate(applicationPrefab, index);
    }

    public void CloseApplication()
    {
        Destroy(applicationPrefab);
    }
}