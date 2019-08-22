﻿<%@ Page Title="" Language="C#"  MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FAI_lab2.Views.Produktet.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
       
      <head>
              <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
            <link rel="stylesheet" href="../../Content/StyleSheet1.css" />
          <link rel="stylesheet" href="../../Content/ProduktiStylesheet.css" />
            <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.13/css/all.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900'>
       
          </head>
        <body>
  <header id="header">
    <div class="container d-flex">
      <a class="logo">
        <img   src="../Images/logo1.png" style="width:100%;"">
      </a>
      <ul class="menu d-flex tab-title">
        <li>
          <a href="../Features/About.aspx">Dashboard</a>
        </li>
        <li>
          <a href="../Features/About.aspx">Features</a>
        </li>
        <li>
          <a href="../Zhvleresimet/Index.aspx">Zhvleresimi</a>
        </li>
        <li>
          <a href="../Amortizimet/Index.aspx">Amortizimi</a>
        </li>
      </ul>
      
    </div>
  </header>
 
         <div id="main">
    <div class="container">
      <div id="product" class="tab-inner">
     
        <div class="info-wrapper">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="javascript:;">
                  <i class="fas fa-home"></i>Home</a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">Produktet</li>
            </ol>
          </nav>
          <div class="info-panel d-flex">
            <h4 class="title">Regjistrimi i Produkteve</h4>
          </div>
        </div>
        <div class="block-1">
          <div class="control d-flex">
            <!-- Button trigger modal -->
            <button type="button" class="btn custom-modal" data-toggle="modal" data-target="#exampleModalCenter">
              Shto Produkt
              <i class="fas fa-plus-circle"></i>
            </button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Shto Produkt</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;
                      </span>
                    </button>
                  </div>
                  <div class="modal-body d-flex">
                    <div class="left-panel">
                     
                    </div>
                     
                    <div class="right-panel">
                      <div class="product-info">
                        <div class="form-group">
                          <label class="item-name">Informacionet</label><br />
                             <asp:Label ID="lblError" runat="server" Text="Fushat e shenjuara me (*) duhet të plotësohen!" Visible="False" CssClass="col-md-12 alert alert-danger"></asp:Label></label>
                    <br />
                             <asp:Label ID="Label1"  runat="server" ></asp:Label>
                            <asp:TextBox ID="EmriTextBox" runat="server" placeholder="Shkruani Emrin e Produktit" CssClass="form-control form-title"></asp:TextBox>
                            
                            </div>
                               <div class="form-group">
                         
                             <asp:Label ID="MbiemriLabel"  runat="server" ></asp:Label>
                            <asp:TextBox ID="ProdhuesiTextBox" runat="server" placeholder="Shkruani prodhuesin " CssClass="form-control form-title"></asp:TextBox>
                        
                        </div>
                        <div class="form-group">
                        
                             <asp:Label ID="NumriTelefonitLabel"  runat="server" ></asp:Label>
                            <asp:TextBox ID="ModeliTextBox" runat="server" placeholder="Modeli" CssClass="form-control form-title"></asp:TextBox>
                        
                        </div>
                          <div class="form-group">
                         
                             <asp:Label ID="Label3"  runat="server" ></asp:Label>
                            <asp:TextBox ID="PershkrimiTextBox" runat="server" placeholder="Shkruani pershkrini" CssClass="form-control form-title"></asp:TextBox>
                        
                        </div>
                               <div class="form-group">
                         
                             <asp:Label ID="Label4"  runat="server" ></asp:Label>
                            <asp:TextBox ID="JetegjatesiaTextBox" runat="server" placeholder="Shkruani jetgjatsin " CssClass="form-control form-title"></asp:TextBox>
                        
                        </div>
                  <div class="form-group">
                        
                             <asp:Label ID="Label5"  runat="server" ></asp:Label>
                            <asp:TextBox ID="CmimiTextBox" runat="server" placeholder="Numri cmimit" CssClass="form-control form-title"></asp:TextBox>
                        
                        </div>
                          <div class="form-group">
                         
                             <asp:Label ID="Label6"  runat="server" ></asp:Label>
                            <asp:TextBox ID="NrSerikTextBox" runat="server" placeholder="Shkruani nr serik" CssClass="form-control form-title"></asp:TextBox>
                        
                        </div>
                           <div class="form-group">
                         
                             <asp:Label ID="Label7"  runat="server" ></asp:Label>
                            <asp:TextBox ID="salvageValueTextBox" runat="server" placeholder="Shkruani salgavek" CssClass="form-control form-title"></asp:TextBox>
                        
                        </div>

                        
           
            <div class="form-group ">
                <label class="col-md-3 control-label" for="form_control">
                    <asp:Label ID="DataLabel" Text="Data*" runat="server"></asp:Label>
                </label>
                <div class="col-md-9">
                    <asp:TextBox ID="DataTextBox" CssClass="form-control" runat="server" Placeholder="Data" Width="114px"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Views/Images/calendar.png" OnClick="ImageButton1_Click" />
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender"></asp:Calendar>
                    <div class="form-control-focus"></div>
                    <asp:Label ID="DataHelpBlockLabel" Text="Caktoni Daten" runat="server" CssClass="help-block"></asp:Label>
                </div>
            </div>
           
          
                          <div class="form-group ">
                           
                            <div class="input-group c-item ">
                              <div class="input-group-prepend">
                                   <asp:Label ID="GrupiLabel" runat="server"  for="inputGroupSelect01" Text="Grupi" CssClass="input-group-text"></asp:Label>
                               </div>
                                <asp:DropDownList ID="GrupiDropDownList" DataTextField="Kategoria" 
                                DataValueField="GrupiID" runat="server" CssClass="input-group-text">
                                </asp:DropDownList> 
                            </div>
                           
                          </div>
                              

            <div class="form-group form-md-line-input">
                <label class="col-md-3 control-label" for="form_control">
                    <asp:Label ID="LlojiLabel" Text="Lloji*" runat="server"></asp:Label>
                </label>
                <asp:RadioButtonList ID="llojiProduktit" runat="server">
                <asp:ListItem id="aset" Text="Aset" Value="Aset" />
                <asp:ListItem id="inventor" Text="Inventor" Value="Inventor" />
                </asp:RadioButtonList>
            </div>
            <div class="form-group form-md-line-input">
                <label class="col-md-3 control-label" for="form_control">
                    <asp:Label ID="StatusiLabel" Text="Statusi*" runat="server"></asp:Label>
                </label>
                <asp:CheckBox ID="StatusiCheckBox" Text="A është duke u përdorur?"  runat="server" />
            </div>
          
                          
                           <div class="bottom-btns d-flex">
                        
                        <asp:Button ID="CancelButton" type="button" runat="server" OnClick="CancelButton_Click"  class="btn btn-Draft" Text="Anulo" />
                        <asp:Button ID="SaveButton" type="button" runat="server" OnClick="SaveButton_Click" class="btn btn-publish" Text="Ruaj" />
                        </div>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

           
      <div class="portlet box green">
        <div class="portlet-title">
            <div class="caption">
                Lista e Produkteve te Regjistruara
            </div>
           
        </div>
        <div class="table table-striped custom-table">
            <asp:GridView
                ID="ListGridView"
                runat="server"
                CssClass="table table-bordered table-striped table-condensed flip-content"
                AllowPaging="True"
                PageSize="51"
                AllowSorting="True"
                AutoGenerateColumns="False"
                Width="100%"
                EditIndex="1"
                EnableViewState="False"
                OnPageIndexChanging="ListGridView_PageIndexChanging"
                OnRowCommand="ListGridView_RowCommand"
                OnRowDataBound="ListGridView_RowDataBound">

                <PagerSettings PageButtonCount="20" FirstPageText="Fillimi" LastPageText="Fundi" />
                <Columns>
                    <asp:TemplateField HeaderText="Emri" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="EmriLabel" runat="server" Text='<%# Bind("Emri") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pershkrimi" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="PershkrimiLabel" runat="server" Text='<%# Bind("Pershkrimi") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prodhuesi" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="ProdhuesiLabel" runat="server" Text='<%# Bind("Prodhuesi") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modeli" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="ModeliLabel" runat="server" Text='<%# Bind("Modeli") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Jetegjatesia" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="JetegjatesiaLabel" runat="server" Text='<%# Bind("Jetegjatesia") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Asset" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="AssetLabel" runat="server" Text='<%# Bind("Lloji") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grupi" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="GrupiLabel" runat="server" Text='<%# Bind("GrupiID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Statusi" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="StatusiLabel" runat="server" Text='<%# Bind("Statusi") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="NrSerik" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="NrSerikLabel" runat="server" Text='<%# Bind("NrSerik") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="salvageValue" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="salvageValueLabel" runat="server" Text='<%# Bind("salvageValue") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cmimi" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="CmimiLabel" runat="server" Text='<%# Bind("Cmimi") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Data" InsertVisible="False">
                        <ItemTemplate>
                            <asp:Label ID="DataLabel" runat="server" Text='<%# Bind("Data1") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="" InsertVisible="False">
                    <ItemTemplate>
                             <asp:LinkButton ID="EditButton"
                                runat="server"
                                CommandName="EditCommandName"
                                CommandArgument='<%# Bind("ProduktiID") %>'
                                class="btn btn-info btn-xs">
                                  Ndrysho
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField InsertVisible="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteButton"
                                runat="server"
                                CommandName="DeleteCommandName"
                                CommandArgument='<%# Bind("ProduktiID") %>'
                               class="btn btn-danger red-mint btn-xs">
                                  Fshije
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
          </div>
        </div></div>

                            <script src='https://code.jquery.com/jquery-3.2.1.slim.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js'></script>

  

    <script  src="js/index.js"></script>

            </body>
        </html>
</asp:Content>