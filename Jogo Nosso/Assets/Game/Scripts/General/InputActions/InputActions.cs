//------------------------------------------------------------------------------
// <auto-generated>
//     This code was auto-generated by com.unity.inputsystem:InputActionCodeGenerator
//     version 1.7.0
//     from Assets/Game/Scripts/General/InputActions/InputActions.inputactions
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Utilities;

public partial class @InputActions: IInputActionCollection2, IDisposable
{
    public InputActionAsset asset { get; }
    public @InputActions()
    {
        asset = InputActionAsset.FromJson(@"{
    ""name"": ""InputActions"",
    ""maps"": [
        {
            ""name"": ""MenuControls"",
            ""id"": ""74480a72-740f-4256-9fb3-fb1f1ab2ec9b"",
            ""actions"": [
                {
                    ""name"": ""OpenPC"",
                    ""type"": ""Button"",
                    ""id"": ""3e67f232-31d0-4a45-be7d-dd3151a6c4cb"",
                    ""expectedControlType"": ""Button"",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                }
            ],
            ""bindings"": [
                {
                    ""name"": """",
                    ""id"": ""5ed093a1-6bd5-42a8-a602-0d65388aed96"",
                    ""path"": ""<Keyboard>/space"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""OpenPC"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                }
            ]
        }
    ],
    ""controlSchemes"": []
}");
        // MenuControls
        m_MenuControls = asset.FindActionMap("MenuControls", throwIfNotFound: true);
        m_MenuControls_OpenPC = m_MenuControls.FindAction("OpenPC", throwIfNotFound: true);
    }

    public void Dispose()
    {
        UnityEngine.Object.Destroy(asset);
    }

    public InputBinding? bindingMask
    {
        get => asset.bindingMask;
        set => asset.bindingMask = value;
    }

    public ReadOnlyArray<InputDevice>? devices
    {
        get => asset.devices;
        set => asset.devices = value;
    }

    public ReadOnlyArray<InputControlScheme> controlSchemes => asset.controlSchemes;

    public bool Contains(InputAction action)
    {
        return asset.Contains(action);
    }

    public IEnumerator<InputAction> GetEnumerator()
    {
        return asset.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }

    public void Enable()
    {
        asset.Enable();
    }

    public void Disable()
    {
        asset.Disable();
    }

    public IEnumerable<InputBinding> bindings => asset.bindings;

    public InputAction FindAction(string actionNameOrId, bool throwIfNotFound = false)
    {
        return asset.FindAction(actionNameOrId, throwIfNotFound);
    }

    public int FindBinding(InputBinding bindingMask, out InputAction action)
    {
        return asset.FindBinding(bindingMask, out action);
    }

    // MenuControls
    private readonly InputActionMap m_MenuControls;
    private List<IMenuControlsActions> m_MenuControlsActionsCallbackInterfaces = new List<IMenuControlsActions>();
    private readonly InputAction m_MenuControls_OpenPC;
    public struct MenuControlsActions
    {
        private @InputActions m_Wrapper;
        public MenuControlsActions(@InputActions wrapper) { m_Wrapper = wrapper; }
        public InputAction @OpenPC => m_Wrapper.m_MenuControls_OpenPC;
        public InputActionMap Get() { return m_Wrapper.m_MenuControls; }
        public void Enable() { Get().Enable(); }
        public void Disable() { Get().Disable(); }
        public bool enabled => Get().enabled;
        public static implicit operator InputActionMap(MenuControlsActions set) { return set.Get(); }
        public void AddCallbacks(IMenuControlsActions instance)
        {
            if (instance == null || m_Wrapper.m_MenuControlsActionsCallbackInterfaces.Contains(instance)) return;
            m_Wrapper.m_MenuControlsActionsCallbackInterfaces.Add(instance);
            @OpenPC.started += instance.OnOpenPC;
            @OpenPC.performed += instance.OnOpenPC;
            @OpenPC.canceled += instance.OnOpenPC;
        }

        private void UnregisterCallbacks(IMenuControlsActions instance)
        {
            @OpenPC.started -= instance.OnOpenPC;
            @OpenPC.performed -= instance.OnOpenPC;
            @OpenPC.canceled -= instance.OnOpenPC;
        }

        public void RemoveCallbacks(IMenuControlsActions instance)
        {
            if (m_Wrapper.m_MenuControlsActionsCallbackInterfaces.Remove(instance))
                UnregisterCallbacks(instance);
        }

        public void SetCallbacks(IMenuControlsActions instance)
        {
            foreach (var item in m_Wrapper.m_MenuControlsActionsCallbackInterfaces)
                UnregisterCallbacks(item);
            m_Wrapper.m_MenuControlsActionsCallbackInterfaces.Clear();
            AddCallbacks(instance);
        }
    }
    public MenuControlsActions @MenuControls => new MenuControlsActions(this);
    public interface IMenuControlsActions
    {
        void OnOpenPC(InputAction.CallbackContext context);
    }
}