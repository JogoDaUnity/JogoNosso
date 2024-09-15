using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MovementHandler : MonoBehaviour
{
    //se o player não estiver funcionando por algum motivo, pode ser por causa do script "PlayerMovementManager"

    //Sprint variables
    [SerializeField] private int MaxStamina = 25;
    [SerializeField] private float CurrentStamina;
    private float WalkSpeed = 5;
    private float runSpeed = 10;
    bool canRun = true;
    bool Running = false;

    //other variables
    private Vector3 inputs;
    [SerializeField] private CharacterController cc;
    private Transform cam;
    [SerializeField] private Text staminatext;

    private void Awake() // atribuição de algumas variaveis ao iniciar o script
    {
        cc = GetComponent<CharacterController>();
        cam = Camera.main.transform;
        
        CurrentStamina = MaxStamina;
    }
    private void Update()
    {
        MoveHandler();
        staminatext.text = $"Stamina: {CurrentStamina:F2}"; //atualizando o texto da stamina na tela
        StaminaManager();
    }

    private void MoveHandler()
    {
        transform.eulerAngles = new Vector3(transform.eulerAngles.x, cam.eulerAngles.y, transform.eulerAngles.z);
        inputs = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
        inputs = transform.TransformDirection(inputs);

        cc.Move(inputs * WalkSpeed * Time.deltaTime);

        if (Input.GetKey(KeyCode.LeftShift) && canRun == true)
        {
            cc.Move(inputs * runSpeed * Time.deltaTime);
            Running = true;
        }
        if (Input.GetKeyUp(KeyCode.LeftShift)) Running = false;
    }

    private void StaminaManager() // Gerenciando a stamina, mas no momento ela está bugada, ent ainda tenho que consertar. A recuperação de stamina está crescendo esponencialmente
    {
        if(Running == true)
        {
            CurrentStamina = CurrentStamina - (CurrentStamina / 120);
        }
        else
        {
            CurrentStamina = CurrentStamina + (CurrentStamina / 200);
            if (CurrentStamina >= MaxStamina) CurrentStamina = MaxStamina;
        }

        if(CurrentStamina <= 0) canRun = false;
        else canRun = true;
    }
}