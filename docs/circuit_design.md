# Circuit Design in Vivado

## Description

To complete circuit design, we want to generate a [Xylinx Support Archive 
(.xsa)](./glossary.md#xsa-file) file. The .xsa file is an 
[HDL wrapper](./glossary.md#hdl-wrapper). With the XSA file, we can then 
simulate our circuit either on real hardware, or within a simulator.

## Steps

1. Create the directory structure for your project.

```
mkdir -p my_first_project/circuit_design
```

2. Open Vivado 2026.1. 

    a) Create a new project, with the directory `my_first_project/circuit_design`.
    Make sure `Create Project Subdirectory` is DISABLED. Click Next.

    b) At the **Project Type** panel, select **RTL Project**. Make sure 
    **Do not specify sources at this time** is selected and nothing else is 
    selected.

    c) At the **Default Part** panel, click on the **Boards** tab, and find
    **Zynq 7000 ZC706 Evaluation Board**. Under **Status**, if the status is a
    download icon, click the download icon to download the board schematics.
    Once you do, the status should change to **Installed**. Select the row for
    the board, and click **Next**.

    d) Click **Finish** to create the project.

3. Click **Create Block Design** on the left panel of the UI. A dialog will open.

    a) Enter **first_zynq_system** as the design name. Click **OK**.

    b) A **Diagram** panel will appear. Click the **+** button to add IP, and 
    select **ZYNQ7 Processing System**.

    c) Click **Run Block Automation**. Ensure that **Apply Board Reset** is 
    selected and click **OK**.

    d) Click the **+** button to add IP again, and select **AXI GPIO**.

    e) Click **Run Connection Automation** and select **/axi_gpio_0/S_AXI**. 
    Click **OK**.

    f) Click **Run Connection Automation** and select **/axi_gpio_0/GPIO**. 
    Under **Select Board Part Interface**, select **led_4bits**. Click **OK**.

    g) Right click in the **Diagram** panel and click **Regenerate Layout**.

4. Save / Validate your design
    
    a) Select **File > Save Block Design** to save.

    b) Select **Tools > Validate Block Design**. This will run a Design Rule 
    Check (DRC).

    c) A dialog should pop up confirming that the design is valid. Click **OK**.

    d) In the **Sources** window, right-click the top-level system design and 
    click **Create HDL Wrapper** (icon for the top-level system design file is 
    square blocks stacked on top of each other). Select **Let Vivado manage and 
    auto-update**.

    e) Click **generate bitstream**. A dialog **Synthesis is out-of-date** will
    appear. Click **Yes** to accept. A **Launch Runs** tab will appear next, 
    increase **number of jobs** to speed up the bitstream generation process,
    and click **OK**.

    This step may take a while to complete, and progress may move to the 
    background. Once it completes, you should have a .xsa file in the 
    `circuit_design` directory.

## Next Steps

1. [Application Development in Vitis](./application_development.md)

## Resources:

* https://www.zynqbook.com/
* https://www.youtube.com/watch?v=_odNhKOZjEo
