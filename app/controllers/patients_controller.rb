class PatientsController < ApplicationController

	before_filter :find_patient, :only => [:show, :edit, :update, :destroy]


  # GET /patients
  # GET /patients.xml
  def index
    @title="Patients"
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.xml
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit

  end

  # POST /patients
  # POST /patients.xml
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to(@patient, :notice => 'Patient was successfully created.') }
        format.xml  { render :xml => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to(@patient, :notice => 'Patient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.xml
  def destroy

    @patient.destroy

    respond_to do |format|
      format.html { redirect_to(patients_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def find_patient
      @patient = Patient.find(params[:id])
  end
end
