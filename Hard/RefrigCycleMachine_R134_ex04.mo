within WalkingInWorldOfThermoFluid.Hard;

model RefrigCycleMachine_R134_ex04
  extends Modelica.Icons.Example;
  //-------------------------
  package fluid1 = Modelica.Media.R134a.R134a_ph;
  package fluid2 = Modelica.Media.Air.DryAirNasa;
  //-------------------------
  parameter Integer sigDigits_T = 4;
  parameter Integer sigDigits_p = 5;
  parameter Integer sigDigits_Q_flow = 5;
  parameter Integer sigDigits_m_flow = 4;
  parameter Integer sigDigits_rho = 4;
  //-------------------------
  /*
                                                                                                                                                                                                                                                                        constant Integer nArrStates = 6;
                                                                                                                                                                                                                                                                        Modelica.Units.SI.Temperature Arr_T[nArrStates];
                                                                                                                                                                                                                                                                        Modelica.Units.SI.SpecificEntropy Arr_s[nArrStates];
                                                                                                                                                                                                                                                                        */
  //-------------------------
  inner Modelica.Fluid.System system(p_ambient = 1e5, T_ambient = 288.15, p_start = 1e5, T_start = 288.15) annotation(
    Placement(transformation(origin = {14, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Fluid.Valves.ValveLinear Valve030(redeclare package Medium = fluid1, dp_nominal = 1e6, m_flow_nominal = 1) annotation(
    Placement(transformation(origin = {84, 211}, extent = {{13, -13}, {-13, 13}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Valve030_open(duration = 1, height = 0, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {57, 211}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {53, 169}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_Valve030_in(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {51, 249}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const(k = 273.15) annotation(
    Placement(transformation(origin = {73, 175}, extent = {{-2, -2}, {2, 2}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {73, 169}, extent = {{-2, -2}, {2, 2}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const1(k = 273.15) annotation(
    Placement(transformation(origin = {72, 243}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {72, 249}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 182}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_Valve030_in(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {103, 237}, extent = {{-8, -5}, {8, 5}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 261.5}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 156}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 249}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_in(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 237}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 169}, extent = {{3, -3}, {-3, 3}}, rotation = 90)));
  Modelica.Fluid.Sensors.DensityTwoPort rho_Valve030_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {84, 182}, extent = {{-3, -3}, {3, 3}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = fluid1, p = 1e5, T = 288.15, nPorts = 1, use_p_in = false) annotation(
    Placement(transformation(origin = {312, 194}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = fluid1, T = 323.15, p(displayUnit = "Pa"), nPorts = 1) annotation(
    Placement(transformation(origin = {252, 126}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium = fluid1, use_portsData = false, V = 0.001, nPorts = 2) annotation(
    Placement(transformation(origin = {84, 278}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Vessels.ClosedVolume Vol031(redeclare package Medium = fluid1, V = 0.001, use_portsData = false, nPorts = 2) annotation(
    Placement(transformation(origin = {84, 138}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP031(redeclare package Medium = fluid1, diameter = 0.05, zeta = 1) annotation(
    Placement(transformation(origin = {108, 126}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Fluid.Sensors.MassFlowRate m_flow_Cmp010_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {258, 298}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP021(redeclare package Medium = fluid1, diameter = 0.05, zeta = 1) annotation(
    Placement(transformation(origin = {100, 298}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_m_flow_Cmp010_out(significantDigits = sigDigits_m_flow) annotation(
    Placement(transformation(origin = {277, 325}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX020 annotation(
    Placement(transformation(origin = {136, 344}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_HX030_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {136, 323}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_hot(T = 298.15) annotation(
    Placement(transformation(origin = {92, 344}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX020 annotation(
    Placement(transformation(origin = {115, 344}, extent = {{-4, -4}, {4, 4}}, rotation = 180)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(transformation(origin = {123, 371}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX020(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {144, 371}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Fluid.Vessels.ClosedVolume HX020(redeclare package Medium = fluid1, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {197, 310}, extent = {{-12, -12}, {12, 12}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor CpHX020(C = 100, T(start = 288.15)) annotation(
    Placement(transformation(origin = {159, 351}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cond_HX020(G = 100) annotation(
    Placement(transformation(origin = {173, 344}, extent = {{-5, 5}, {5, -5}}, rotation = 180)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice dP011(redeclare package Medium = fluid1, diameter = 0.05, zeta = 1) annotation(
    Placement(transformation(origin = {232, 298}, extent = {{8, -8}, {-8, 8}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {162, 298}, extent = {{-3, -3}, {3, 3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {176, 298}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX020_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {151, 287}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Blocks.Sources.Constant const2(k = 273.15) annotation(
    Placement(transformation(origin = {172, 281}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {172, 287}, extent = {{-2, 2}, {2, -2}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_HX020_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {185, 273}, extent = {{3, 3}, {-3, -3}})));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(transformation(origin = {177, 273}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_p_HX020_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {157, 273}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Fluid.Vessels.ClosedVolume HX040(redeclare package Medium = fluid1, V = 0.1, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(transformation(origin = {153, 114}, extent = {{12, 12}, {-12, -12}})));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort s_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {216, 126}, extent = {{3, 3}, {-3, -3}}, rotation = 180)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {178, 126}, extent = {{-3, 3}, {3, -3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_T_HX020_out1(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {203, 115}, extent = {{-11, -7}, {11, 7}}, rotation = -0)));
  Modelica.Blocks.Sources.Constant const21(k = 273.15) annotation(
    Placement(transformation(origin = {184, 107}, extent = {{-2, -2}, {2, 2}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback21 annotation(
    Placement(transformation(origin = {184, 115}, extent = {{2, 2}, {-2, -2}}, rotation = -180)));
  Modelica.Fluid.Sensors.Pressure p_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {171, 147}, extent = {{3, -3}, {-3, 3}}, rotation = -0)));
  Modelica.Blocks.Math.Gain gain2(k = 1/1000) annotation(
    Placement(transformation(origin = {163, 147}, extent = {{2, -2}, {-2, 2}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_p_HX040_out(significantDigits = sigDigits_T) annotation(
    Placement(transformation(origin = {143, 147}, extent = {{11, -7}, {-11, 7}})));
  Modelica.Fluid.Sensors.DensityTwoPort rho_HX040_out(redeclare package Medium = fluid1) annotation(
    Placement(transformation(origin = {202, 126}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_rho_HX040_out(significantDigits = sigDigits_rho) annotation(
    Placement(transformation(origin = {189, 144}, extent = {{8, -5}, {-8, 5}}, rotation = -0)));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_HX040 annotation(
    Placement(transformation(origin = {112, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_HX040_hconv(duration = 1, height = 0, offset = 1*5000, startTime = 10) annotation(
    Placement(transformation(origin = {112, 39}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_cold(T = 283.15) annotation(
    Placement(transformation(origin = {68, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor Q_flow_HX040 annotation(
    Placement(transformation(origin = {93, 60}, extent = {{4, -4}, {-4, 4}}, rotation = -180)));
  Modelica.Blocks.Math.Gain gain3(k = 1/1000) annotation(
    Placement(transformation(origin = {107, 87}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Q_flow_HX040(significantDigits = sigDigits_Q_flow) annotation(
    Placement(transformation(origin = {128, 87}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor CpHX040(C = 100, T(start = 288.15)) annotation(
    Placement(transformation(origin = {135, 67}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor cond_HX040(G = 100) annotation(
    Placement(transformation(origin = {151, 60}, extent = {{5, 5}, {-5, -5}}, rotation = -180)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp010_PR(duration = 5, height = 5, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {353, 258}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Product product annotation(
    Placement(transformation(origin = {337, 256}, extent = {{3, -3}, {-3, 3}})));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 1, height = 0, offset = 100*1000, startTime = 10) annotation(
    Placement(transformation(origin = {341, 117}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume Vol011(redeclare package Medium = fluid1, V = 0.01, nPorts = 2, use_portsData = false) annotation(
    Placement(transformation(origin = {312, 280}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Machines.ControlledPump Cmp010(redeclare package Medium = fluid1, control_m_flow = false, redeclare function efficiencyCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.constantEfficiency(eta_nominal = 1), m_flow_nominal = 1, p_a_nominal = 1e5, p_b_nominal = 1e6, use_p_set = true, use_powerCharacteristic = false, p_a_start (displayUnit = "Pa"), p_b_start (displayUnit = "Pa"), T_start (displayUnit = "K")) annotation(
    Placement(transformation(origin = {312, 251}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume Vol010(redeclare package Medium = fluid1, V = 0.01, nPorts = 2, use_portsData = false) annotation(
    Placement(transformation(origin = {312, 222}, extent = {{-6, -6}, {6, 6}})));
equation
/*
  Arr_s[1] = s_Cmp010_in.s;
  Arr_s[2] = s_Cmp010_out.s;
  Arr_s[3] = s_Valve030_in.s;
  Arr_s[4] = s_Valve030_out.s;
  Arr_s[5] = s_HX040_out.s;
  Arr_s[6] = s_Cmp010_in.s;

  Arr_T[1] = T_Cmp010_in.T;
  Arr_T[2] = T_Cmp010_out.T;
  Arr_T[3] = T_Valve030_in.T;
  Arr_T[4] = T_Valve030_out.T;
  Arr_T[5] = T_HX040_out.T;
  Arr_T[6] = T_Cmp010_in.T;
  */
//
  connect(ramp_Valve030_open.y, Valve030.opening) annotation(
    Line(points = {{62.5, 211}, {74, 211}}, color = {0, 0, 127}));
  connect(const.y, feedback.u2) annotation(
    Line(points = {{73, 172.8}, {73, 170.8}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_out.numberPort, feedback.y) annotation(
    Line(points = {{65.65, 169}, {70.65, 169}}, color = {0, 0, 127}));
  connect(const1.y, feedback1.u2) annotation(
    Line(points = {{72, 245.2}, {72, 247.2}}, color = {0, 0, 127}));
  connect(realValue_T_Valve030_in.numberPort, feedback1.y) annotation(
    Line(points = {{63.65, 249}, {69.3, 249}}, color = {0, 0, 127}));
  connect(s_Valve030_in.port_b, T_Valve030_in.port_a) annotation(
    Line(points = {{84, 258.5}, {84, 252}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_in.T, feedback1.u1) annotation(
    Line(points = {{80.7, 249}, {74, 249}}, color = {0, 0, 127}));
  connect(rho_Valve030_in.d, realValue_rho_Valve030_in.numberPort) annotation(
    Line(points = {{87.3, 237}, {93.3, 237}}, color = {0, 0, 127}));
  connect(T_Valve030_in.port_b, rho_Valve030_in.port_a) annotation(
    Line(points = {{84, 246}, {84, 240}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_in.port_b, Valve030.port_a) annotation(
    Line(points = {{84, 234}, {84, 224}}, color = {0, 127, 255}, thickness = 2));
  connect(T_Valve030_out.T, feedback.u1) annotation(
    Line(points = {{80.7, 169}, {74.7, 169}}, color = {0, 0, 127}));
  connect(T_Valve030_out.port_b, s_Valve030_out.port_a) annotation(
    Line(points = {{84, 166}, {84, 159}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.d, realValue_rho_Valve030_out.numberPort) annotation(
    Line(points = {{87.3, 182}, {94.3, 182}}, color = {0, 0, 127}));
  connect(Valve030.port_b, rho_Valve030_out.port_a) annotation(
    Line(points = {{84, 198}, {84, 185}}, color = {0, 127, 255}, thickness = 2));
  connect(rho_Valve030_out.port_b, T_Valve030_out.port_a) annotation(
    Line(points = {{84, 179}, {84, 172}}, color = {0, 127, 255}, thickness = 2));
  connect(Vol030.ports[1], s_Valve030_in.port_a) annotation(
    Line(points = {{84, 272}, {84, 264.5}}, color = {0, 127, 255}));
  connect(s_Valve030_out.port_b, Vol031.ports[1]) annotation(
    Line(points = {{84, 153}, {84, 132}}, color = {0, 127, 255}));
  connect(dP031.port_a, Vol031.ports[2]) annotation(
    Line(points = {{100, 126}, {84, 126}, {84, 132}}, color = {0, 127, 255}));
  connect(dP021.port_b, Vol030.ports[2]) annotation(
    Line(points = {{92, 298}, {84, 298}, {84, 272}}, color = {0, 127, 255}));
  connect(gain1.y, realValue_Q_flow_HX020.numberPort) annotation(
    Line(points = {{126.3, 371}, {131.6, 371}}, color = {0, 0, 127}));
  connect(T_hot.port, Q_flow_HX020.port_b) annotation(
    Line(points = {{102, 344}, {111, 344}}, color = {191, 0, 0}));
  connect(Q_flow_HX020.port_a, conv_HX020.fluid) annotation(
    Line(points = {{119, 344}, {126, 344}}, color = {191, 0, 0}));
  connect(ramp_HX030_hconv.y, conv_HX020.Gc) annotation(
    Line(points = {{136, 327.4}, {136, 334.8}}, color = {0, 0, 127}));
  connect(gain1.u, Q_flow_HX020.Q_flow) annotation(
    Line(points = {{119.4, 371}, {115, 371}, {115, 348}}, color = {0, 0, 127}));
  connect(cond_HX020.port_a, HX020.heatPort) annotation(
    Line(points = {{178, 344}, {185, 344}, {185, 310}}, color = {191, 0, 0}));
  connect(CpHX020.port, cond_HX020.port_b) annotation(
    Line(points = {{159, 344}, {167, 344}}, color = {191, 0, 0}));
  connect(conv_HX020.solid, CpHX020.port) annotation(
    Line(points = {{146, 344}, {159, 344}}, color = {191, 0, 0}));
  connect(HX020.ports[1], dP011.port_b) annotation(
    Line(points = {{197, 298}, {224, 298}}, color = {0, 127, 255}));
  connect(dP011.port_a, m_flow_Cmp010_out.port_b) annotation(
    Line(points = {{240, 298}, {253, 298}}, color = {0, 127, 255}));
  connect(T_HX020_out.port_a, HX020.ports[2]) annotation(
    Line(points = {{179, 298}, {198, 298}}, color = {0, 127, 255}));
  connect(s_HX020_out.port_a, T_HX020_out.port_b) annotation(
    Line(points = {{165, 298}, {173, 298}}, color = {0, 127, 255}));
  connect(const2.y, feedback2.u2) annotation(
    Line(points = {{172, 283}, {172, 285}}, color = {0, 0, 127}));
  connect(realValue_T_HX020_out.numberPort, feedback2.y) annotation(
    Line(points = {{164, 287}, {170, 287}}, color = {0, 0, 127}));
  connect(feedback2.u1, T_HX020_out.T) annotation(
    Line(points = {{174, 287}, {176, 287}, {176, 295}}, color = {0, 0, 127}));
  connect(dP021.port_a, s_HX020_out.port_b) annotation(
    Line(points = {{108, 298}, {160, 298}}, color = {0, 127, 255}));
  connect(HX020.ports[3], p_HX020_out.port) annotation(
    Line(points = {{198, 298}, {185, 298}, {185, 276}}, color = {0, 127, 255}));
  connect(gain.u, p_HX020_out.p) annotation(
    Line(points = {{179, 273}, {182, 273}}, color = {0, 0, 127}));
  connect(realValue_p_HX020_out.numberPort, gain.y) annotation(
    Line(points = {{170, 273}, {175, 273}}, color = {0, 0, 127}));
  connect(const21.y, feedback21.u2) annotation(
    Line(points = {{184, 109}, {184, 113}}, color = {0, 0, 127}));
  connect(realValue_T_HX020_out1.numberPort, feedback21.y) annotation(
    Line(points = {{190.35, 115}, {186, 115}}, color = {0, 0, 127}));
  connect(feedback21.u1, T_HX040_out.T) annotation(
    Line(points = {{182, 115}, {178, 115}, {178, 123}}, color = {0, 0, 127}));
  connect(dP031.port_b, HX040.ports[1]) annotation(
    Line(points = {{116, 126}, {153, 126}}, color = {0, 127, 255}));
  connect(HX040.ports[2], T_HX040_out.port_a) annotation(
    Line(points = {{153, 126}, {175, 126}}, color = {0, 127, 255}));
  connect(gain2.u, p_HX040_out.p) annotation(
    Line(points = {{165.4, 147}, {168, 147}}, color = {0, 0, 127}));
  connect(realValue_p_HX040_out.numberPort, gain2.y) annotation(
    Line(points = {{155.65, 147}, {160.65, 147}}, color = {0, 0, 127}));
  connect(HX040.ports[3], p_HX040_out.port) annotation(
    Line(points = {{153, 126}, {171, 126}, {171, 144}}, color = {0, 127, 255}));
  connect(realValue_rho_HX040_out.numberPort, rho_HX040_out.d) annotation(
    Line(points = {{198, 144}, {202, 144}, {202, 130}}, color = {0, 0, 127}));
  connect(gain3.y, realValue_Q_flow_HX040.numberPort) annotation(
    Line(points = {{110.3, 87}, {115.6, 87}}, color = {0, 0, 127}));
  connect(ramp_HX040_hconv.y, conv_HX040.Gc) annotation(
    Line(points = {{112, 43.4}, {112, 50.8}}, color = {0, 0, 127}));
  connect(gain3.u, Q_flow_HX040.Q_flow) annotation(
    Line(points = {{103.4, 87}, {93, 87}, {93, 64}}, color = {0, 0, 127}));
  connect(conv_HX040.solid, CpHX040.port) annotation(
    Line(points = {{122, 60}, {135, 60}}, color = {191, 0, 0}));
  connect(T_cold.port, Q_flow_HX040.port_a) annotation(
    Line(points = {{78, 60}, {89, 60}}, color = {191, 0, 0}));
  connect(Q_flow_HX040.port_b, conv_HX040.fluid) annotation(
    Line(points = {{97, 60}, {102, 60}}, color = {191, 0, 0}));
  connect(CpHX040.port, cond_HX040.port_a) annotation(
    Line(points = {{136, 60}, {146, 60}}, color = {191, 0, 0}));
  connect(cond_HX040.port_b, HX040.heatPort) annotation(
    Line(points = {{156, 60}, {165, 60}, {165, 114}}, color = {191, 0, 0}));
  connect(realValue_m_flow_Cmp010_out.numberPort, m_flow_Cmp010_out.m_flow) annotation(
    Line(points = {{264, 325}, {258, 325}, {258, 304}}, color = {0, 0, 127}));
  connect(product.u1, ramp_Cmp010_PR.y) annotation(
    Line(points = {{340.6, 257.8}, {347.1, 257.8}}, color = {0, 0, 127}));
  connect(ramp_p1.y, product.u2) annotation(
    Line(points = {{341, 121}, {341, 254}}, color = {0, 0, 127}));
  connect(m_flow_Cmp010_out.port_a, Vol011.ports[1]) annotation(
    Line(points = {{264, 298}, {312, 298}, {312, 274}}, color = {0, 127, 255}));
  connect(Cmp010.p_set, product.y) annotation(
    Line(points = {{320, 256}, {334, 256}}, color = {0, 0, 127}));
  connect(Cmp010.port_b, Vol011.ports[2]) annotation(
    Line(points = {{312, 262}, {312, 274}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Vol010.ports[1]) annotation(
    Line(points = {{312, 204}, {312, 216}}, color = {0, 127, 255}));
  connect(Vol010.ports[2], Cmp010.port_a) annotation(
    Line(points = {{312, 216}, {312, 242}}, color = {0, 127, 255}));
  connect(T_HX040_out.port_b, rho_HX040_out.port_a) annotation(
    Line(points = {{182, 126}, {200, 126}}, color = {0, 127, 255}));
  connect(rho_HX040_out.port_b, s_HX040_out.port_a) annotation(
    Line(points = {{206, 126}, {214, 126}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], s_HX040_out.port_b) annotation(
    Line(points = {{242, 126}, {220, 126}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "4.1.0")),
    Diagram(coordinateSystem(extent = {{0, 380}, {360, 0}}), graphics = {Text(origin = {61, 160}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {59, 243}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 178}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {108, 233}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {287, 319}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/s]", horizontalAlignment = TextAlignment.Left), Text(origin = {152, 363}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left), Text(origin = {159, 281}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {171, 267}, extent = {{-5, 2}, {5, -2}}, textString = "[kPa]", horizontalAlignment = TextAlignment.Left), Text(origin = {213, 109}, extent = {{-5, 2}, {5, -2}}, textString = "[degC]", horizontalAlignment = TextAlignment.Left), Text(origin = {157, 141}, extent = {{-5, 2}, {5, -2}}, textString = "[kPa]", horizontalAlignment = TextAlignment.Left), Text(origin = {194, 140}, extent = {{-5, 2}, {5, -2}}, textString = "[kg/m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {136, 81}, extent = {{-4, 2}, {4, -2}}, textString = "[kW]", horizontalAlignment = TextAlignment.Left)}),
    version = "",
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end RefrigCycleMachine_R134_ex04;