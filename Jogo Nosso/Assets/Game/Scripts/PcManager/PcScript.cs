using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PcScript : MonoBehaviour
{
    //Script inteiro responsavel por gerenciar o computador do menu principal
    [SerializeField] public Animator anim;
    //[SerializeField] private Material pcScreen;
    [SerializeField] private GameObject ExitPanel;

    private void Update()
    {
        OpenPc();
    }

    public void OpenPc()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            anim.Play("Camera");
            //pcScreen.color = Color.white;
        }
    }

    // Região responsavel pelo gerenciamento de fechar o jogo, ou sair do computador
    #region QuitGame
    public void OpenExitPanel()
    {
        ExitPanel.SetActive(true);
    }
    public void ClosePc()
    {
        anim.Play("Exit");
        //pcScreen.color = Color.black;
        ExitPanel.SetActive(false);
    }
    public void QuitGame()
    {
        Application.Quit();
    }
    #endregion     
}