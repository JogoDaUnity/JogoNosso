using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerMovementManager : MonoBehaviour
{
    //Script usado para gerenciar se o player pode se movimentar ou não (futuramente adicionar uma função no MovementHandler para isso, e usar esse aqui para fazer a verificação)
    MovementHandler mH;
    [SerializeField] GameObject playerCam;
    [SerializeField] Camera pcCam;


    private void Awake()
    {
        mH = GetComponentInChildren<MovementHandler>();
        MoveManager();
    }

    private void MoveManager()
    {
        //verificar a cena do player
        Scene currentScene = SceneManager.GetActiveScene();
        int sceneIndex = currentScene.buildIndex;
       
        
        if (sceneIndex == 0) // se o index for 0 (menu) o script do player e a camera vão ser desabilitadas, e o pc ativo
        {
            mH.enabled = false;
            playerCam.SetActive(false);
            pcCam.enabled = true;
        }
        else // se for diferente de 0, o player vai ficar ativo
        {
            mH.enabled = true;
            pcCam.enabled = false;
            playerCam.SetActive(false);
        }
    }
}