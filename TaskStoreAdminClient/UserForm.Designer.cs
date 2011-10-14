namespace TaskStoreAdminClient
{
    partial class UserForm
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
            this.UserGrid = new System.Windows.Forms.DataGridView();
            this.Add = new System.Windows.Forms.Button();
            this.Delete = new System.Windows.Forms.Button();
            this.Save = new System.Windows.Forms.Button();
            this.TaskLists = new System.Windows.Forms.Button();
            this.Tags = new System.Windows.Forms.Button();
            this.ListTypes = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.UserGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // UserGrid
            // 
            this.UserGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.UserGrid.Location = new System.Drawing.Point(-2, 0);
            this.UserGrid.Name = "UserGrid";
            this.UserGrid.Size = new System.Drawing.Size(908, 479);
            this.UserGrid.TabIndex = 0;
            this.UserGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.UserGrid_CellContentClick);
            // 
            // Add
            // 
            this.Add.Location = new System.Drawing.Point(923, 12);
            this.Add.Name = "Add";
            this.Add.Size = new System.Drawing.Size(75, 23);
            this.Add.TabIndex = 1;
            this.Add.Text = "Add";
            this.Add.UseVisualStyleBackColor = true;
            // 
            // Delete
            // 
            this.Delete.Location = new System.Drawing.Point(923, 54);
            this.Delete.Name = "Delete";
            this.Delete.Size = new System.Drawing.Size(75, 23);
            this.Delete.TabIndex = 2;
            this.Delete.Text = "Delete";
            this.Delete.UseVisualStyleBackColor = true;
            this.Delete.Click += new System.EventHandler(this.Delete_Click);
            // 
            // Save
            // 
            this.Save.Location = new System.Drawing.Point(923, 97);
            this.Save.Name = "Save";
            this.Save.Size = new System.Drawing.Size(75, 23);
            this.Save.TabIndex = 3;
            this.Save.Text = "Save";
            this.Save.UseVisualStyleBackColor = true;
            // 
            // TaskLists
            // 
            this.TaskLists.Location = new System.Drawing.Point(923, 193);
            this.TaskLists.Name = "TaskLists";
            this.TaskLists.Size = new System.Drawing.Size(75, 23);
            this.TaskLists.TabIndex = 4;
            this.TaskLists.Text = "TaskLists";
            this.TaskLists.UseVisualStyleBackColor = true;
            this.TaskLists.Click += new System.EventHandler(this.TaskLists_Click);
            // 
            // Tags
            // 
            this.Tags.Location = new System.Drawing.Point(923, 237);
            this.Tags.Name = "Tags";
            this.Tags.Size = new System.Drawing.Size(75, 23);
            this.Tags.TabIndex = 5;
            this.Tags.Text = "Tags";
            this.Tags.UseVisualStyleBackColor = true;
            // 
            // ListTypes
            // 
            this.ListTypes.Location = new System.Drawing.Point(923, 280);
            this.ListTypes.Name = "ListTypes";
            this.ListTypes.Size = new System.Drawing.Size(75, 23);
            this.ListTypes.TabIndex = 6;
            this.ListTypes.Text = "ListTypes";
            this.ListTypes.UseVisualStyleBackColor = true;
            // 
            // UserForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1010, 477);
            this.Controls.Add(this.ListTypes);
            this.Controls.Add(this.Tags);
            this.Controls.Add(this.TaskLists);
            this.Controls.Add(this.Save);
            this.Controls.Add(this.Delete);
            this.Controls.Add(this.Add);
            this.Controls.Add(this.UserGrid);
            this.Name = "UserForm";
            this.Text = "Users";
            this.Load += new System.EventHandler(this.UserForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.UserGrid)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView UserGrid;
        private System.Windows.Forms.Button Add;
        private System.Windows.Forms.Button Delete;
        private System.Windows.Forms.Button Save;
        private System.Windows.Forms.Button TaskLists;
        private System.Windows.Forms.Button Tags;
        private System.Windows.Forms.Button ListTypes;

    }
}

