namespace TaskStoreAdminClient
{
    partial class TaskListForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.TaskListGrid = new System.Windows.Forms.DataGridView();
            this.Save = new System.Windows.Forms.Button();
            this.Delete = new System.Windows.Forms.Button();
            this.Add = new System.Windows.Forms.Button();
            this.TaskGrid = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.TaskSave = new System.Windows.Forms.Button();
            this.TaskDelete = new System.Windows.Forms.Button();
            this.TaskAdd = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.TaskListGrid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.TaskGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // TaskListGrid
            // 
            this.TaskListGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.TaskListGrid.Location = new System.Drawing.Point(-1, 1);
            this.TaskListGrid.Name = "TaskListGrid";
            this.TaskListGrid.Size = new System.Drawing.Size(821, 178);
            this.TaskListGrid.TabIndex = 0;
            this.TaskListGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.TaskListGrid_CellContentClick);
            // 
            // Save
            // 
            this.Save.Location = new System.Drawing.Point(840, 97);
            this.Save.Name = "Save";
            this.Save.Size = new System.Drawing.Size(75, 23);
            this.Save.TabIndex = 6;
            this.Save.Text = "Save";
            this.Save.UseVisualStyleBackColor = true;
            this.Save.Click += new System.EventHandler(this.Save_Click);
            // 
            // Delete
            // 
            this.Delete.Location = new System.Drawing.Point(840, 54);
            this.Delete.Name = "Delete";
            this.Delete.Size = new System.Drawing.Size(75, 23);
            this.Delete.TabIndex = 5;
            this.Delete.Text = "Delete";
            this.Delete.UseVisualStyleBackColor = true;
            // 
            // Add
            // 
            this.Add.Location = new System.Drawing.Point(840, 12);
            this.Add.Name = "Add";
            this.Add.Size = new System.Drawing.Size(75, 23);
            this.Add.TabIndex = 4;
            this.Add.Text = "Add";
            this.Add.UseVisualStyleBackColor = true;
            // 
            // TaskGrid
            // 
            this.TaskGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.TaskGrid.Location = new System.Drawing.Point(-1, 238);
            this.TaskGrid.Name = "TaskGrid";
            this.TaskGrid.Size = new System.Drawing.Size(821, 206);
            this.TaskGrid.TabIndex = 7;
            this.TaskGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.TaskGrid_CellContentClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(32, 199);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 25);
            this.label1.TabIndex = 8;
            this.label1.Text = "Tasks";
            // 
            // TaskSave
            // 
            this.TaskSave.Location = new System.Drawing.Point(840, 335);
            this.TaskSave.Name = "TaskSave";
            this.TaskSave.Size = new System.Drawing.Size(75, 23);
            this.TaskSave.TabIndex = 11;
            this.TaskSave.Text = "Save";
            this.TaskSave.UseVisualStyleBackColor = true;
            this.TaskSave.Click += new System.EventHandler(this.TaskSave_Click);
            // 
            // TaskDelete
            // 
            this.TaskDelete.Location = new System.Drawing.Point(840, 292);
            this.TaskDelete.Name = "TaskDelete";
            this.TaskDelete.Size = new System.Drawing.Size(75, 23);
            this.TaskDelete.TabIndex = 10;
            this.TaskDelete.Text = "Delete";
            this.TaskDelete.UseVisualStyleBackColor = true;
            // 
            // TaskAdd
            // 
            this.TaskAdd.Location = new System.Drawing.Point(840, 250);
            this.TaskAdd.Name = "TaskAdd";
            this.TaskAdd.Size = new System.Drawing.Size(75, 23);
            this.TaskAdd.TabIndex = 9;
            this.TaskAdd.Text = "Add";
            this.TaskAdd.UseVisualStyleBackColor = true;
            // 
            // TaskListForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(927, 456);
            this.Controls.Add(this.TaskSave);
            this.Controls.Add(this.TaskDelete);
            this.Controls.Add(this.TaskAdd);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.TaskGrid);
            this.Controls.Add(this.Save);
            this.Controls.Add(this.Delete);
            this.Controls.Add(this.Add);
            this.Controls.Add(this.TaskListGrid);
            this.Name = "TaskListForm";
            this.Text = "TaskLists";
            this.Load += new System.EventHandler(this.TaskListForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.TaskListGrid)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.TaskGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView TaskListGrid;
        private System.Windows.Forms.Button Save;
        private System.Windows.Forms.Button Delete;
        private System.Windows.Forms.Button Add;
        private System.Windows.Forms.DataGridView TaskGrid;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button TaskSave;
        private System.Windows.Forms.Button TaskDelete;
        private System.Windows.Forms.Button TaskAdd;
    }
}