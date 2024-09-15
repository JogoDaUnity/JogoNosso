using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PcInteractionsHandler : MonoBehaviour
{
    [SerializeField] GameObject pcUI;
    [SerializeField] GameObject otherUI;
    [SerializeField] private Material pcScreen;
    private InputActions inputActions;
    [SerializeField] GameObject pcCam;
    [SerializeField] public Animator anim;

    private void Awake()
    {
        inputActions = new InputActions();
    }
    private void Update()
    {
        CamPositionManager();
    }

    private void CamPositionManager()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            anim.Play("Camera");
            pcScreen.color = Color.white;
        }
    }
}