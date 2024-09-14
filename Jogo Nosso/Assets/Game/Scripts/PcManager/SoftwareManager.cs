using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SoftwareManager : MonoBehaviour
{
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
    public void EnterGame()
    {
        SceneManager.LoadScene(1);
    }
}