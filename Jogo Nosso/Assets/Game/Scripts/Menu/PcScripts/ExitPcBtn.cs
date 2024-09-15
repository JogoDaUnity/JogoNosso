using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ExitPcBtn : MonoBehaviour
{
    // script usado somento no botão de fechar o pc
    [SerializeField] private PcInteractionsHandler animScript;
    [SerializeField] GameObject exitSoft;

    public void ExitIconButton()
    {
        exitSoft.SetActive(true);
    }

    public void QuitButton()
    {
        Application.Quit();
        Debug.Log("Game Quit");
    }
    public void QuitPC()
    {
        animScript.anim.Play("Exit");
    }
}