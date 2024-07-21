using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MovementHandler : MonoBehaviour
{
    //Sprint variables
    [SerializeField] private int MaxStamina = 25;
    [SerializeField] private float CurrentStamina;
    private float WalkSpeed = 5;
    private float runSpeed = 10;
    bool canRun = true;
    bool Running = false;

    //other variables
    private Vector3 inputs;
    private CharacterController cc;
    private Transform cam;
    [SerializeField] private Text staminatext;

    private void Awake()
    {
        cc = GetComponent<CharacterController>();
        cam = Camera.main.transform;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        CurrentStamina = MaxStamina;
    }
    private void Update()
    {
        MoveHandler();
        staminatext.text = $"Stamina: {CurrentStamina:F2}";
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

    private void StaminaManager()
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